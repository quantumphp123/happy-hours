<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Places;
use App\Models\Category;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Image;
use App\Models\Offer;
use App\Models\Review;
use App\Models\Favourite;
use App\Models\Notification;
use App\Models\User_availability;
use App\Models\Place_category;
use Illuminate\Support\Str;
use Carbon\Carbon;
use DB;
use Session;
use Validator;

class UserController extends Controller
{
    public function login(Type $var = null)
    {
        if (session()->get('user-login-id') == null) {
            return view('User.Login');
        } else {
            return redirect()->route('User.Dashboard');
        }
    }

    public function Profile(Type $var = null)
    {
        $id = session()->get('user-login-id');
        $user = Places::with('categories')
            ->where('id', session()->get('user-login-id'))
            ->first();
        //dd($user);
        return view('User.Profile', compact('user'));
    }

    public function login_post(Request $request)
    {
        //$credentials = $request->only('email','password');
        $useLoginId = Places::where(['email' => $request->email])->first();
        //dd( $useLoginId->password);
        if (!$useLoginId || !Hash::check($request->password, $useLoginId->password)) {
            //dd('errror');
            return back()->with('err_msg', 'Invalid Username or Password.');
            //return redirect()->route('user.login');
        } else {
            //dd($useLoginId);
            session()->put('user-login-id', $useLoginId->id);
            //dd(session()->get('user-login-id'));
            return redirect(url('user/dashboard'));
        }
    }
    public function Availability()
    {
        return view('User.userAvailability');
    }

    public function register(Type $var = null)
    {
        if (session()->get('user-login-id') == null) {
            $categories = Category::pluck('CategoryName', 'id');

            return view('User.Register', compact('categories'));
        } else {
            return redirect()->route('User.Dashboard');
        }
    }

    public function register_post(request $req)
    {
        $services = $req->service;
        array_pop($services);

        $service = implode(',', $services);

        $validatedData = $req->validate([
            'email' => 'required|email|unique:places',
            'name' => 'required',
            'category' => 'required',
            'location' => 'required',
            'marketing_name' => 'required',
            'marketing_email' => 'required|email|unique:places,marketing_email',
            'marketing_phone' =>  [
                'unique:places,mobile',
                'required',
                'regex:/^(\+\d{1,2}?)?\(?\d{3}\)?[\s]?\d{3}[\s]?\d{4}$/',
                ],
            'password' => 'required|min:8|max:16',
            'mobile' => [
                'unique:places,mobile',
                'required',
                'digits:10',
                ],
            'website' => [
                'required',
                'regex:/^((https?|ftp|smtp):\/\/)?(www.)?[a-z0-9]+\.[a-z]+(\/[a-zA-Z0-9#]+\/?)*$/',
                ],
            'streetnumber' => 'required',
            'streetname' => 'required',
            'city' => 'required',
            'zipcode' => 'required',
            'image' => 'required',
            'desc' => 'required',
            'business_owner_name' => 'required',
            'business_owner_type' => 'required',
        ]);
        
        $address = $req->streetnumber . ' ' . $req->streetname . ' ' . $req->city . ' ' . $req->landmark . ' ' . $req->zipcode;
        $baseurl = url('/');
        if ($req->image != null) {
            //echo "yes";
            $image = $req->image;
            $rand = rand(1000, 99999);
            $name = $rand . '.' . $image->getClientOriginalExtension();
            $destination = public_path('/place');

            /**compress image starts here */

            // $img = Image::make($image->getRealPath());
            // $img->resize(100, 100, function ($constraint) {
            //     $constraint->aspectRatio();
            // })->save($destination.'/'.$name);
            /**compress image ends here */

            $image->move($destination, $name);
            $path = $baseurl . '/public/place/' . $name;
        } else {
            $path = '';
        }

        $categoryName = Category::where('id', $req->category)->pluck('categoryName');
        
        $place = new Places();
        //$place->categoryId=$req->category;
        //$place->categoryName=$categoryName[0];
        $place->mobile = $req->mobile;
        $place->email = $req->email;
        $place->business_owner_type = $req->business_owner_type;
        $place->business_owner_name = $req->business_owner_name;
        $place->address = $address;
        $place->placeName = $req->name;
        $place->location = $req->location;
        $place->website = $req->website;
        $place->marketing_phone = $req->marketing_phone;
        $place->marketing_name = $req->marketing_name;
        $place->marketing_email = $req->marketing_email;
        $place->marketing_name = $req->marketing_name;
        $place->services = $service;
        $place->image = $path;
        $place->streetnumber=$req->streetnumber;
        $place->streetname=$req->streetname;
        $place->city=$req->city;
        $place->landmark=$req->landmark;
        $place->zipcode=$req->zipcode;
        $place->description = $req->desc;
        //$place->closesAt=$req->end_time;
        // $place->opensAt=$req->location;
        $place->password = Hash::make($req->password);
        $place->save();
        $categoryids = $req->category;
        $place->categories()->attach($categoryids);

        session()->put('user-login-id', $place->id);
        return redirect()->route('Availability');

        //return view('User.Register',compact('categories'));
    }

    public function logout()
    {
        //dd(session()->get('user-login-id'));
        Auth::logout();
        Session::flush();

        return redirect()->route('user.login');
    }

    public function index()
    {
        $data = Places::where('id', session()->get('user-login-id'))->first();
        $images = Image::where('place_id', session()->get('user-login-id'))->pluck('image');
        $availibilty = User_availability::where('user_id', session()->get('user-login-id'))->get();

        return view('User.Dashboard', compact('data', 'images', 'availibilty'));
    }

    public function chats(Type $var = null)
    {
        return view('User.Chat');
    }

    public function Notifications(Type $var = null)
    {
        $data = Notification::where('placeId', session()->get('user-login-id'))->get(['id', 'heading', 'message', 'time', 'image_path']);
        return view('User.Notifications', compact('data'));
    }
    public function NotificationDelete($id)
    {
        $data = Notification::find($id);
        $data->delete();
        return back()->with('success', 'Notification deleted');
    }
    public function change_pass()
    {
        //dd($user);
        return view('User.Change_password');
    }

    public function change_pass_post(request $request)
    {
        //dd($req->all());
        $id = session()->get('user-login-id');
        $user = Places::where('id', session()->get('user-login-id'))->first();
        //dd($request->all());
        $validatedData = $request->validate([
            'current_password' => 'required|min:8|max:16',
            'new_password' => 'required|min:8|max:16',
            'confirm_password' => 'required|min:8|max:16',
            //
        ]);

        if ($request->new_password == $request->confirm_password) {
            if (!Hash::check($request->current_password, $user->password)) {
                return redirect()
                    ->back()
                    ->with('error', 'Your current password does not matches with the password you provided. Please try again.');
            }

            if (strcmp($request->get('current_password'), $request->get('new_password')) == 0) {
                //Current password and new password are same
                return redirect()
                    ->back()
                    ->with('error', 'New Password cannot be same as your current password. Please choose a different password.');
            }

            //Change Password
            //$user = Auth::user();
            $user->password = Hash::make($request->get('new_password'));
            $user->save();

            return redirect()
                ->back()
                ->with('success', 'Password Changed Successfully');
        } else {
            return redirect()
                ->back()
                ->with('error', 'Password and Confirm Password Do not Match !');
        }
    }

    public function edit(request $req)
    {
        //dd($req->all());

        $place = Places::find(session()->get('user-login-id'));
        if ($place == null) {
            return back()->with('error', 'Profile  not found');
        }
        $address = $req->streetnumber . ' ' . $req->streetname . ' ' . $req->city . ' ' . $req->landmark . ' ' . $req->zipcode;
        //$place->categoryId=$req->category;
        //$place->categoryName=$categoryName[0];
        $place->marketing_email = $req->marketing_email;
        $place->placeName = $req->name;
        $place->location = $req->location;
        $place->marketing_name = $req->marketing_name;
        $place->marketing_phone = $req->marketing_phone;
        $place->website = $req->website;
        $place->address = $address;
        $place->description = $req->description;
        $place->streetname = $req->streetname;
        $place->streetnumber = $req->streetnumber;
        $place->zipcode = $req->zipcode;
        $place->city = $req->city;
        $place->landmark = $req->landmark;
        $place->update();
        return back()->with('update', 'Profile updated');
    }

    public function gallery()
    {
        $place_id = session()->get('user-login-id');
        $images = Image::where('place_id', $place_id)->pluck('image', 'id');
        //dd($images);
        return view('User.Gallery', compact('images'));
    }

    public function image_upload(request $req)
    {
        $images = $req->image;

        $userImages = Image::where('place_id', session()->get('user-login-id'))->count();

        if (count($images) > 5 || $userImages >= 5) {
            return back()->with('error', 'You cant insert more than 5 images for a place !');
        } else {
            foreach ($req->file('image') as $key => $file) {
                $name = time() . $key . '.' . $file->extension();
                //$dest_path='public/Place_upload';
                $file->move(public_path('Place_uploads'), $name);
                $data[] = $name;
            }
            //dd($data);
            $baseurl = url('/');

            for ($i = 0; $i < count($data); $i++) {
                $image = new Image();

                $image->image = $baseurl . '/public/Place_uploads/' . $data[$i];
                $image->place_id = session()->get('user-login-id');
                $image->save();
            }

            return back()->with('success', 'image  uploaded sucessful!');
        }
    }
    /*public function ImageDelete($id)
            {

                
                   $data=Image::find($id);

                   //dd($data[0]->image);
                   $dest=base_path()."\public\Place_uploads"."/".basename($data->image);
                   //dd($dest);
                   unlink($dest);
                   $data->delete();
                   return back()->with('delete', 'image  Deleteed sucessfully!');

            }*/
    public function ImageDelete($id)
    {
        $data = Image::find($id);

        $string_no = strpos($data->image, 'public');
        //dd($string_no);
        $new_image = substr($data->image, $string_no);
        $str = $data->image;
        $storage = unlink($new_image);
        if ($storage) {
            $data->delete();
            return back()->with('delete', 'image  Deleted sucessfully!');
        } else {
            return back()->with('error', 'something went wrong!');
        }

        //dd($data[0]->image);
    }

    public function Offers(Type $var = null)
    {
        $placeId = session()->get('user-login-id');
        $offers = Offer::where('place_id', $placeId)
            ->orderBy('id', 'DESC')
            ->get();
        //dd($offers);
        return view('User.Offers', compact('offers'));
    }

    public function OfferPost(request $req)
    {
        $offer = new Offer();
        $offer->place_id = session()->get('user-login-id');
        $offer->Heading = $req->heading;
        $file = $req->image;
        $baseurl = url('/');
        if ($req->image != null) {
            $name = time() . '.' . $req->image->extension();
            //$dest_path='public/Place_upload';
            $file->move(public_path('Offers'), $name);
            $offer->image = $baseurl . '/public/Offers/' . $name;
        }
        $offer->description = $req->desc;
        $offer->valid_upto = $req->valid;

        $offer->save();

        return redirect()
            ->route('UserOffers')
            ->with('success', 'offer added');
    }

    public function CreateOffer()
    {
        return view('User.CreateOffer');
    }

    public function OfferDelete($id)
    {
        $offer = Offer::find($id);
        if ($offer->image != null) {
            //$data=Image::find($id);

            $string_no = strpos($offer->image, 'public');
            //dd($string_no);
            $new_image = substr($offer->image, $string_no);
            $str = $offer->image;
            $storage = unlink($new_image);
            if ($storage) {
                $offer->delete();
                return back()->with('delete', 'image  Deleted sucessfully!');
            } else {
                return back()->with('error', 'something went wrong!');
            }
        } else {
            $offer->delete();
        }
        return back()->with('delete', 'offer deleted');
    }

    public function notify(request $req, $id)
    {
        $offer = Offer::findOrFail($id);
        
        $notification = new Notification();
        $notification->placeId = $offer->place_id;
        $notification->message = $offer->description;
        $notification->heading = $offer->Heading;
        $notification->image_path = $offer->Image;
        $notification->time = date('H:i:s');
        $notification->save();

        $offer->is_notified=1;
        $offer->save();
        
        return redirect()
            ->route('UserOffers')
            ->with('success', 'Notification sent successfully');
    }
    
    protected function PostAvail($day, $start, $end)
    {
        if ($start != $end) {
            $availibility = new User_availability();
            $availibility->start = $start;
            $availibility->day = $day;
            $availibility->end = $end;
            $availibility->user_id = session()->get('user-login-id');
            $availibility->save();
        } else {
            $availibility = new User_availability();
            $availibility->is_open = 0;
            $availibility->day = $day;
            $availibility->user_id = session()->get('user-login-id');
            $availibility->save();
        }
    }

    public function UseravailibilityPost(request $req)
    {
        $this->PostAvail('monday', $req->start_time1, $req->end_time1);
        //case tuesday
        $this->PostAvail('tuesday', $req->start_time2, $req->end_time2);
        //case wednesday
        $this->PostAvail('wednesday', $req->start_time3, $req->end_time3);
        //case  thursday
        $this->PostAvail('thursday', $req->start_time4, $req->end_time4);
        //case friday
        $this->PostAvail('friday', $req->start_time5, $req->end_time5);
        //case saturday
        $this->PostAvail('saturday', $req->start_time6, $req->end_time6);
        //case sunday
        $this->PostAvail('sunday', $req->start_time7, $req->end_time7);

        return redirect()->route('LocationCreate');
    }

    public function Useravailibility()
    {
        $data = User_availability::where('user_id', session()->get('user-login-id'))->get();
        //dd($data);
        return view('User.User_availibilty', compact('data'));
    }

    public function UserCategories(Type $var = null)
    {
        $Placecategories = Place_category::where('places_id', session()->get('user-login-id'))
            ->pluck('category_id')
            ->toarray();
        $categories = Category::pluck('categoryName', 'id');

        //dd($categories);
        return view('User.Categories', compact('categories', 'Placecategories'));
    }
    public function UserDetails(Type $var = null)
    {
        $services = Places::where('id', session()->get('user-login-id'))->pluck('services');
        $services = explode(',', $services[0]);
        return view('User.Details', ['services'=>$services]);
    }
    public function UserDetailsUpdate(request $req)
    {
        $id = session()->get('user-login-id');
        $place=Places::findOrFail($id);
        $a=$req->services;
        $services = implode(',', $a);
        $place->update([
            'services'=> $services   
        ]);
        return back()->with('success', 'Details updated succesfully !');
    }

    public function UserCategoryUpdate(request $req)
    {
        $validator = Validator::make($req->all(), [
            'categories' => 'required',
        ]);
        if ($validator->fails()) {
            return back()
                ->with('error', $validator)
                ->withInput();
        } else {
            $place = Places::find(session()->get('user-login-id'));
            $place->categories()->detach();
            $categories = $req->categories;
            //dd($services);

            $place->categories()->attach($categories);
            return back()->with('success', 'Category updated succesfully !');
        }
    }

    public function UserAvailibilityUpdate(request $req)
    {
        $data = User_availability::find($req->id);

        if ($data->start == null || $data->end == null) {
            return response()->json([
                'message' => 'you Need to update the day start and day end  first',
                'responseCode' => 408,
            ]);
        } else {
            $status = 0;
            if ($data->is_open == 0) {
                $status = 1;
            }

            $data->is_open = $status;
            $data->save();
            return response()->json([
                'status' => $status,
                'responseCode' => 200,
            ]);
        }
    }

    public function UserAvailibilityUpdateTime($id)
    {
        $data = User_availability::find($id);
        return view('User.UserAvailibilityEdit', compact('data'));
    }

    public function UserAvailibilityEditTime(request $req)
    {
        $data = User_availability::find($req->id);
        $data->start = $req->start;
        $data->end = $req->end;
        $data->save();
        return redirect()
            ->route('user.availability')
            ->with('success', 'Time updated successfullty');
    }

    public function CreateLocation(Type $var = null)
    {
        return view('User.UserLocationPost');
    }

    public function PostLoaction(request $req)
    {
        //dd($req->all());
        $user = Places::find(session()->get('user-login-id'));
        $user->longitude = $req->lng;
        $user->lattitude = $req->lat;
        $user->save();

        return redirect()->route('User.Dashboard');
    }

    //user forgot password code
    public function forgotPassword()
    {
        return view('User.forget_password');
    }

    public function forgotSendMail(Request $request)
    {
        $email = $request->email;
        $user = Places::where('email', $email)->first();

        if ($user) {
            $token = Str::random(60);
            //Create Password Reset Token
            DB::table('password_resets')->insert([
                'email' => $request->email,
                'token' => $token,
                'created_at' => Carbon::now(),
            ]);

            //Get the token just created above
            $tokenData = DB::table('password_resets')
                ->where('email', $request->email)
                ->first();

            $data['user_id'] = $user['id'];
            $data['email'] = $user['email'];
            $data['url'] = url('/user/password-reset/' . $token);
            $url = $data['url'];
            $to = $data['email'];
            $subject = 'Password Reset Link';

            $details = [
                'url' => $url,
                'title' => 'Mail from Happy hours',
                'body' => 'Use this OTP to  Reset Your password',
            ];

            \Mail::to($data['email'])->send(new \App\Mail\ForgotPassword($details));

            return redirect()
                ->back()
                ->withSuccess('Email sent successfully');
        } else {
            return redirect()
                ->back()
                ->withError('Email ID does not exist.');
        }
    }

    public function resetPassword($token)
    {
        $tokenData = DB::table('password_resets')
            ->where('token', $token)
            ->first();
        //dd($tokenData);
        // Redirect the user back to the password reset request form if the token is invalid
        if (!$tokenData) {
            return redirect('login')->withError('Invalid Token.');
        }

        $user = Places::where('email', $tokenData->email)->first();

        if (!$user) {
            return redirect()
                ->back()
                ->withError('Email not found');
        }

        return view('User.reset_password', compact('token'));
    }

    public function resetPasswordSave(Request $request)
    {
        // Validate the token
        $tokenData = DB::table('password_resets')
            ->where('token', $request->token)
            ->first();

        $user = Places::where('email', $tokenData->email)->first();

        //Hash and update the new password
        $user->password = Hash::make($request->password);
        $user->save();

        //Delete the token
        DB::table('password_resets')
            ->where('email', $user->email)
            ->delete();

        return redirect('user/login')->withSuccess('Password Reset Successfully.Login To Continue.');
    }

    public function UserReviews(Type $var = null)
    {
        $reviews = Review::where('placeId', session()->get('user-login-id'))->get();
        return view('User.Reviews', compact('reviews'));
    }

    public function EditProfilePic(request $req)
    {
        //unlink old one
        $place = Places::where('id', session()->get('user-login-id'))->first();
        $image = $place->image;
        $string_no = strpos($image, 'public');
        $new_image = substr($image, $string_no);
        $str = $image;
        $storage = unlink($new_image);

        //link new one
        $baseurl = url('/');
        $image = $req->image;
        $rand = rand(1000, 99999);
        $name = $rand . '.' . $image->getClientOriginalExtension();
        $destination = public_path('/place');

        $image->move($destination, $name);
        $path = $baseurl . '/public/place/' . $name;

        $place->image = $path;
        $place->update();

        return back()->with('update', 'Profile pic updated');
    }
}
