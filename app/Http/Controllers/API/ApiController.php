<?php
namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Listuser;
use App\Models\Category;
use App\Models\Places;
use App\Models\Review;
use App\Models\Favourite;
use App\Models\Notification;
use App\Models\Place_category;
use App\Models\User_availability;
use App\Models\Image;
use App\Models\Offer;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use DB;
use Illuminate\Http\JsonResponse;


class ApiController extends Controller
{
    public function signup(Request $request)
    {
        
        try {
            $validatedData = $request->validate([
                'firstName' => 'required|string',
                'email' => 'required|string|email|max:255|unique:users',
                'mobile' => 'nullable|numeric|digits:10|unique:users',
                'dateOfBirth' => 'nullable|date',
                'password' => 'required|string | min:6',
            ]);
        } catch (ValidationException $e) {
            $errors = $e->errors();
            $firstError = reset($errors)[0]; // Retrieve the first error message
            return response()->json([
                'responseCode' => 201,
                'responseMessage' => $firstError,
            ]);
        }
        
        $user = Listuser::create([
            'firstName' => $request->firstName,
            'lastName' => $request->lastName,
            'email' => $request->email,
            'mobile' => $request->mobile,
            'dateOfBirth' => $request->dateOfBirth,
            'password' => Hash::make($request->password),
        ]);
        
        if ($user) {
            return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'User Created successfully!',
            ]);
        } else {
            return response()->json([
                'responseCode' => 400,
                'responseMessage' => 'Oops! Something went wrong!',
            ]);
        }
    }
    
    public function login(Request $request)
    {
        try {
            $credentials = $request->validate([
                'email' => 'required|string|max:50',
                'password' => 'required|string|min:6',
            ]);
        } catch (ValidationException $e) {
            return response()->json([
                'responseCode' => 400,
                'responseMessage' => $e->errors(),
            ]);
        }
        
        if (!Auth::guard('listusers')->attempt($credentials)) {
            return response()->json([
                'responseCode' => 401,
                'responseMessage' => 'Invalid email or password',
            ]);
        }
        
        $user = Auth::guard('listusers')->user();
        
        $token = $user->createToken('api-token')->plainTextToken;
        $data['user'] = $user;
        $data['token'] = $token;
        return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'success',
                'data' => $data,
            ]);
    }
    
    public function getProfile(Request $request)
    {
        $data = Listuser::where('id', $request->user_id)->get();
        if (count($data) > 0) {
            return response()->json(
                [
                    'responseCode' => 200,
                    'responseMessage' => 'Ok',
                    'data' => $data[0],
                ],
                200);
        } else {
            return response()->json(
                [
                    'responseCode' => 404,
                    'responseMessage' => 'User not found',
                ],
                200);
        }
    }
    
    public function updateProfile(Request $request)
    {
        $user = Listuser::find($request->userId);
        if (!$user) {
            return response()->json([
                'responseCode' => 404,
                'responseMessage' => 'User not found!',
            ]);
        }
        if ($user->email != $request->email) {
            $exists = Listuser::where('email', $request->email)->exists();
            if ($exists) {
                return response()->json([
                    'responseCode' => 401,
                    'responseMessage' => 'Email already exists',
                ]);
            }
        }
        $imagePath = $user->imagePath;
        if ($request->hasFile('profileImage')) {
            $image = $request->file('profileImage');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destination = public_path('/profileImage');
            $image->move($destination, $name);
            // $path = public_path("images\\".$name);
            $baseurl = url('/');
            $path = $baseurl . '/public/profileImage/' . $name;
        } else {
            $path = $imagePath;
        }
        $user->firstName = $request->firstName;
        $user->lastName = $request->lastName;
        $user->email = $request->email;
        $user->mobile = $request->mobile;
        $user->dateOfBirth = $request->dateOfBirth;
        $user->imagePath = $path;
        $user->save();
        if ($user) {
            return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'Profile Updated',
                'data' => $user,
            ]);
        } else {
            return response()->json([
                'responseCode' => 406,
                'responseMessage' => 'Error while Updating data',
            ]);
        }
    }
    
    //-----------------------------------------Gurman---------------------------------------------------------------//
public function homepage(Request $request)
{
    $location = $request->location;
    $userId = $request->userId;
    $categoryName = $request->categoryName;

    // Retrieve categories based on categoryName
    if ($categoryName == null) {
        $categories = Category::with('places')->get(['id', 'categoryName']);
    } else {
        $categories = Category::where('categoryName', $categoryName)->get(['id', 'categoryName']);
    }

    // Iterate over categories and update isdisplay, isFav, and AvgRating for each place
    foreach ($categories as $category) {
        foreach ($category->places as $place) {
            // Update isdisplay based on location and status
            if ($request->location == 'allCities' && $place->status == 1) {
                $place->isdisplay = 1;
            } else if ($place->location == $request->location && $place->status == 1) {
                $place->isdisplay = 1;
            } else {
                $place->isdisplay = 0;
            }

            // Check if the place is in the user's favorites
            $checkFavourite = Favourite::where('userId', $userId)
                ->where('placeId', $place->id)
                ->exists();
            $place->isFav = $checkFavourite ? 1 : 0;

            // Calculate average rating for the place
            $place->AvgRating = $this->AvgRating($place->id);
        }
    }

    $categoryCount = count($categories);

    // Return response based on categoryCount
    if ($categoryCount) {
        return response()->json([
            'responseCode' => 200,
            'responseMessage' => 'Ok',
            'location' => $location,
            'data' => $categories,
        ]);
    } else {
        return response()->json([
            'responseCode' => 404,
            'location' => $location,
            'responseMessage' => 'No data found',
        ]);
    }
}

    
    public function AvgRating($id)
    {
        $place = Review::where('placeId', $id)->pluck('rating');
        $count = 0;
        $reviews = count($place);
        for ($i = 0; $i < count($place); $i++) {
            $count += $place[$i];
        }
        //$count;
        //return $reviews;
        if ($reviews == 0) {
            return 0;
        }
        return number_format((float) ($count / $reviews), 1, '.', ',');
    }
    
    public function placeDetail(Request $request)
    {
        $userId = $request->userId;
        $data = Places::find($request->placeId);
        $images = Image::where('place_id', $request->placeId)
            ->pluck('image')
            ->take(5);
        $offers = Offer::where('status', 1)
            ->where('place_id', $request->placeId)
            ->get(['Heading', 'valid_upto', 'description', 'Image']);
        $BusinessHours = User_availability::where('user_id', $request->placeId)->get(['is_open', 'start', 'end', 'day']);
        $categories_id = Place_category::where('places_id', $request->placeId)->pluck('category_id');
        $categories = [];
        foreach ($categories_id as $key => $value) {
            $name = Category::where('id', $value)->pluck('categoryName');
            array_push($categories, $name[0]);
        }
        $checkFavourite = Favourite::where('userId', $userId)
            ->where('placeId', $request->placeId)
            ->exists();
        if ($checkFavourite) {
            $isFav = 1;
        } else {
            $isFav = 0;
        }
        if ($data) {
            return response()->json(
                [
                    'responseCode' => 200,
                    'responseMessage' => 'Ok',
                    'isFav' => $isFav,
                    'averageRating' => $this->AvgRating($request->placeId),
                    'location' => $data['location'],
                    'data' => $data,
                    'images' => $images,
                    'offers' => $offers,
                    'BusinessHours' => $BusinessHours,
                    'categories' => $categories,
                ],
                200,
            );
        } else {
            return response()->json([
                'responseCode' => 404,
                'responseMessage' => 'Invalid Place Id',
            ]);
        }
    }
    
    public function addReview(Request $request)
    {
        $userId = $request->userId;
        $placeId = $request->placeId;
        $rating = $request->rating;
        $message = $request->message;
        $insert = new Review();
        $insert->placeId = $placeId;
        $insert->userId = $userId;
        $insert->rating = $rating;
        $insert->message = $message;
        $insert->save();
        $place = Places::find($placeId);
        $place->ratings = $this->AvgRating($placeId);
        $place->save();
        if ($insert) {
            return response()->json(
                [
                    'responseCode' => 200,
                    'responseMessage' => 'Review Added',
                ],
                200,
            );
        } else {
            return response()->json(
                [
                    'responseCode' => 401,
                    'responseMessage' => 'Some error occured',
                ],
                401,
            );
        }
    }
    
    public function placeReviews(Request $request)
    {
        $placeId = $request->placeId;
        $data = DB::table('reviews')
            ->join('users', 'users.id', '=', 'reviews.userId')
            ->where('reviews.placeId', $placeId)
            ->get(['reviews.id', 'reviews.placeId', 'users.firstName', 'users.lastName', 'reviews.rating', 'reviews.message', 'reviews.created_at']);
        $count = count($data);
        if (count($data) > 0) {
            return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'Ok',
                'totalReviews' => $count,
                'data' => $data,
            ]);
        } else {
            return response()->json([
                'responseCode' => 404,
                'responseMessage' => 'Review not found',
            ]);
        }
    }
    
    public function addToFavourite(Request $request)
    {
        $placeId = $request->placeId;
        $userId = $request->userId;
        $exist = Favourite::where('placeId', $placeId)
            ->where('userId', $userId)
            ->exists();
        if ($exist) {
            return response()->json([
                'responseCode' => 208,
                'responseMessage' => 'Already added to Favourites',
            ]);
        }
        $insert = new Favourite();
        $insert->userId = $userId;
        $insert->placeId = $placeId;
        $insert->save();
        if ($insert) {
            return response()->json(
                [
                    'responseCode' => 200,
                    'responseMessage' => 'Added to Favourites',
                ],
                200,
            );
        } else {
            return response()->json([
                'responseCode' => 401,
                'responseMessage' => 'Some error occured',
            ]);
        }
    }
    
    public function removeFromFavourite(Request $request)
    {
        $placeId = $request->placeId;
        $userId = $request->userId;
        $delete = Favourite::where('placeId', $placeId)
            ->where('userId', $userId)
            ->delete();
        if ($delete) {
            return response()->json(
                [
                    'responseCode' => 200,
                    'responseMessage' => 'Removed from Favourites',
                ],
                200,
            );
        } else {
            return response()->json([
                'responseCode' => 401,
                'responseMessage' => 'Some error occured',
            ]);
        }
    }
    
    public function getFavourite(Request $request)
    {
        $userId = $request->userId;
        $data = DB::table('favourite as fav')
            ->join('places as pla', 'pla.id', '=', 'fav.placeId')
            ->where('fav.userId', $userId)
            ->get('pla.*');
        foreach ($data as $rows) {
            $rows->isFav = 1;
            $rows->AvgRating = $this->AvgRating($rows->id);
        }
        if (count($data) > 0) {
            return response()->json(
                [
                    'responseCode' => 200,
                    'responseMessage' => 'Ok',
                    'data' => $data,
                ],
                200,
            );
        } else {
            return response()->json([
                'responseCode' => 404,
                'responseMessage' => 'Favourites not found',
            ]);
        }
    }
    
    ############ NEW ###########
    public function notification(Request $request)
    {
        $userId = auth()->user()->id;
        $favouritePlaceIds = Favourite::where('userId', $userId)->pluck('placeId')->toArray();
    
        $notifications = Notification::with(['place' => function ($query) {
            $query->select(['id', 'placeName']); // Specify the desired fields from the place table
        }])->whereIn('placeId', $favouritePlaceIds)
            ->orderBy('created_at', 'desc')
            ->get()
            ->map(function ($notification) {
            $notification['placeName'] = $notification['place']['placeName'];
            unset($notification['place']);
            return $notification;
        });
            
        
        
    
        if ($notifications->isNotEmpty()) {
            return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'Ok',
                'data' => $notifications,
            ], 200);
        } else {
            return response()->json([
                'responseCode' => 404,
                'responseMessage' => 'Notification not found',
            ]);
        }
    }

    ######### OLD #############
    // public function notification(Request $request)
    // {
    //     $userId = $request->userId;
    //     $Favourite = Favourite::where('userId', $userId)->pluck('placeId');
    //     //return $Favourite;
    //     $notifications = [];
    //     $data = [];
    //     foreach ($Favourite as $key => $value) {
    //         $notification = Notification::where('placeId', $value)->get();
    //         if (count($notification)) {
    //             $data[]=$notification;
    //             //array_push($data, $notification);
    //         }
    //     }

    //     $notis=[];
    //     for( $i=0;$i<count($data);$i++){
    //         for( $j=0;$j<count($data[$i]);$j++){
    //             $notis[]=$data[$i][$j];
    //         }
    //     }
        
    //     if (count($data) > 0) {
    //         return response()->json(
    //             [
    //                 'responseCode' => 200,
    //                 'responseMessage' => 'Ok',
    //                 'data' => $notis,
    //             ],
    //             200,
    //         );
    //     } else {
    //         return response()->json([
    //             'responseCode' => 404,
    //             'responseMessage' => 'Notification not found',
    //         ]);
    //     }
    // }
    
    public function placesWithOffers(Request $request)
    {
        $location = $request->location;
        $userId = $request->userId;
        if (empty($location)) {
            $location = null;
        }
        $places_id = Offer::where('status', 1)
            ->groupBy('place_id')
            ->pluck('place_id');
        $places = [];
        //return $places;
        // Places::where('location', 'like', '%'.$location.'%')
        //->where('offers', '!=', '')
        //->get();
        //return $places;
        if (count($places_id)) {
            foreach ($places_id as $key => $value) {
                $data = Places::with('offers')->find($value);
                if ($data && $location == null) {
                    $checkFavourite = Favourite::where('userId', $userId)
                        ->where('placeId', $value)
                        ->exists();
                    if ($checkFavourite) {
                        $isFav = 1;
                    } else {
                        $isFav = 0;
                    }
                    /**add flag to check if it is fav or not */
                    $data->isFav = $isFav;
                    $data->AvgRating = $this->AvgRating($data->id);
                    array_push($places, $data);
                }
                if ($data && $data->location == $location) {
                    $checkFavourite = Favourite::where('userId', $userId)
                        ->where('placeId', $value)
                        ->exists();
                    if ($checkFavourite) {
                        $isFav = 1;
                    } else {
                        $isFav = 0;
                    }
                    /**add flag to check if it is fav or not */
                    $data->isFav = $isFav;
                    $data->AvgRating = $this->AvgRating($data->id);
                    array_push($places, $data);
                }
            }
        }
        if (count($places) == 0) {
            return response()->json([
                'responseCode' => 404,
                'responseMessage' => 'No data found',
            ]);
        } else {
            return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'Ok',
                'data' => $places,
            ]);
        }
    }
    
    public function updatePass(Request $request)
    {
        try {
            $request->validate([
                'current_password' => 'required|string',
                'new_password' => 'required|string|min:6',
                'confirm_password' => 'required|string|min:6',
            ]);
        } catch (ValidationException $e) {
            return response()->json([
                'responseCode' => 400,
                'responseMessage' => $e->errors(),
            ]);
        }
        
        $user = Auth::user();
        if(Hash::check($request->current_password, $user->password)){
            if($request->new_password != $request->confirm_password){
                return response()->json([
                    'responseCode' => 401,
                    'responseMessage' => 'The new password confirmation does not match.',
                ]);
            }
            if (Hash::check($request->new_password, $user->password)) {
                return response()->json([
                    'responseCode' => 401,
                    'responseMessage' => 'Your new password cannot be same as old.',
                ]);
            }
            $user->password = Hash::make($request->new_password);
            $user->save();
            return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'Password changed successfully.',
            ]);
        }else{
            return response()->json([
                'responseCode' => 401,
                'responseMessage' => 'Your current password is incorrect.',
            ]);
        }
    }
    
    public function filter(Request $req)
    {
        // Retrieve filter parameters from the request
        $category = $req->categoryName;
        $location = $req->location;
        $rating = number_format($req->rating,1);
        // dd($rating);
        // Start building the query for items
        $query = Places::query();
        
        // Apply category filter if provided
        if ($category != null && $rating != '') {
            $query->whereHas('categories', function ($query) use ($category) {
                $query->where('category.categoryName', $category);
            });
        }
        
        
        // Apply location filter if provided
        if($location != null && $rating != ''){
            $query->where('location', 'like', '%' . $location . '%');
        }
        
        // Apply rating filter if provided
        if($rating != null && $rating != 0 && $rating != ''){
            $query->where('ratings', '<=', $rating);
        }
        
        // Retrieve the filtered items with their associated categories
        $places = $query->with('categories')->get();
        
        ### For Test Services ###
        // $places = $places->map(function($place){
        //      $data = [
        //         'location' => $place->location,              
        //         'rating' => $place->ratings,
        //         'category' => $place->categories->where('categoryName', 'Bar'),
        //          ];
        //      return $data;
        // });
        
        return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'success',
                'places' => $places,
            ]);
    }
    
    public function ForgotPass_otp(request $req)
    {
        $user = Listuser::where('email', $req->email)->first();
        if (!$user){
            return response()->json([
                'responseCode' => 404,
                'responseMessage' => 'User not found ! ',
            ]);
        } else {
            $digits = 4;
            $otp = str_pad(rand(0, pow(10, $digits) - 1), $digits, '0', STR_PAD_LEFT);
            $user->otp = $otp;
            $user->save();
            
            $details = [
                'title' => 'Mail from Happy hours',
                'body' => 'Use this OTP to  Reset Your password',
                'otp' => $otp,
            ];

            \Mail::to($req->email)->send(new \App\Mail\ForgotPass($details));
            
            return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'Otp sent',
            ]);
        }
    }
    
    public function verify_otp(request $req)
    {
        $data = Listuser::where('email', $req->email)->get();
        $user = $data['0'];
        if ($user->otp == $req->otp) {
            return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'OTP verified',
            ]);
        } else {
            return response()->json([
                'responseCode' => 401,
                'responseMessage' => 'OTP does not match ',
            ]);
        }
    }
    
   public function changepassword(Request $request)
{
    // Validate the required fields
    $request->validate([
        'email' => 'required|email',
        'new_password' => 'required|string|min:8',
        'confirm_password' => 'required|string|min:8',
    ]);

    $data = Listuser::where('email', $request->email)->get();
    if ($data->isEmpty()) {
        return response()->json([
            'responseCode' => 404,
            'responseMessage' => 'User not found.',
        ]);
    }

    $user = $data['0'];

    if ($request->new_password == $request->confirm_password) {
        if (Hash::check($request->new_password, $user->password)) {
            // Current password and new password are same
            return response()->json([
                'responseCode' => 401,
                'responseMessage' => 'New Password cannot be the same as your current password. Please choose a different password.',
            ]);
        }
        // Change Password
        $user->password = Hash::make($request->new_password);
        $user->save();
        return response()->json([
            'responseCode' => 200,
            'responseMessage' => 'Password Changed Successfully',
        ]);
    } else {
        return response()->json([
            'responseCode' => 401,
            'responseMessage' => 'New password and confirm password must be the same!',
        ]);
    }
}

    
    public function ViewAllCategory(request $req)
    {
        $category_id = Category::where('categoryName', $req->CategoryName)->pluck('id');
        $id = $category_id[0];
        $data = Place_category::where('category_id', $id)->pluck('places_id');
        //return $data;
        $places = [];
        foreach ($data as $key => $value) {
            $place = Places::find($value);
            if ($place->location == $req->location) {
                array_push($places, $place);
            }
        }
        if (count($places)) {
            return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'Data found!',
                'data' => $places,
            ]);
        } else {
            return response()->json([
                'responseCode' => 401,
                'responseMessage' => 'No Data Found',
            ]);
        }
    }
    
    public function DeleteAccount(request $req)
    {
        $user = Listuser::find($req->userId);
        if (!$user) {
            return response()->json([
                'responseCode' => 400,
                'responseMessage' => 'Account Not Found!',
            ]);
        }
        $del = Listuser::where('id', $req->userId)->delete();
        Review::where('userId', $req->userId)->delete();
        Favourite::where('userId', $req->userId)->delete();
        if ($del) {
            return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'Account deleted!',
            ]);
        } else {
            return response()->json([
                'responseCode' => 400,
                'responseMessage' => 'internal error occured',
            ]);
        }
    }
    
    public function getPlaces(){
        $places = Places::all()->sortBy('created_at')->toArray();
        return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'success',
                'places' => $places,
            ]);
    }
    
    public function getCategoryList(){
        // $categories = Category::all()->sortBy('categoryName')
        // ->map(function($category){
        //     $data['id'] = $category->id; 
        //     $data['name'] = $category->categoryName;
        //     return $data;
        // });
        $categories = Category::all(['id', 'categoryName'])->toArray();
        
        return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'success',
                'categories' => $categories,
            ]);
    }
    
    public function destroy($id)
    {
        // Find the user by id
        $user = Listuser::find($id);

        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        // Delete the user
        $user->delete();

        return response()->json(['message' => 'User deleted successfully']);
    }
    
     public function destroy_user(Request $request)
    {
        // Retrieve the currently authenticated user
        $user = Auth::user();

        if ($user instanceof ListUser) {
            // Delete the user account
            $user->delete();

            return response()->json(['message' => 'User account deleted successfully.'], 200);
        }

        return response()->json(['message' => 'Unauthorized'], 401);
    }
}
