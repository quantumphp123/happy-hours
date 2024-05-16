<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\Listuser;
use App\Models\Category;
use App\Models\Places;
use App\Models\Review;
use App\Models\Image;
use App\Models\Admin;
use App\Models\User_availability;
use App\Models\Place_category;
use Session;
use Validator;
use DB;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Str;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.login');
    }

    public function searchPlaces(Request $request)
    {
        $searchTerm = $request->search;
        $error = null;
        if ($searchTerm != '') {
            $places = Places::where(function ($query) use ($searchTerm) {
                    $query->where('placeName', 'like', '%' . $searchTerm . '%')
                        ->orWhere('email', 'like', '%' . $searchTerm . '%')
                        ->orWhere('mobile', 'like', '%' . $searchTerm . '%')
                        ->orWhere('location', 'like', '%' . $searchTerm . '%');
                })
                ->orWhereHas('categories', function ($query) use ($searchTerm) {
                    $query->where('categoryName', 'like', '%' . $searchTerm . '%');
                })
                ->orderBy('id', 'desc')
                ->paginate(10);

            if ($places->count() > 0) {
                return view('admin.places.index', compact('places', 'searchTerm'));
            }else{
                $error = 'No results found.';
            }
        }

        $places = Places::orderBy('id', 'desc')->paginate(10);
        return redirect()->route('places')->with('error', $error);
    }


	public function login_post(Request $request)
	{
		$credentials = $request->only('email','password');
// 		$data = Admin::where('email', $request->email)->first();
// // 		dd($data->password);
// 		if(Hash::check($request->password, $data->password)){
// 		    dd("matched");
// 		}else{
// 		    dd("not matched");
// 		}
		if(Auth::attempt($credentials)){
			if(Auth::user()->role_id == 1){
    			$useLoginId=User::where(['email'=>$request->email])->get();
    			session()->put('admin-login-id',$useLoginId[0]->id);
    			return redirect(url('admin-dashboard'));
			} else {
				Session::flush();
				Auth::logout();
				return back()->with('err_msg','Unauthorised access.');
			}
		} else {
			return back()->with('err_msg','Invalid Username or Password.');
		}
	}

	public function admin_dashboard()
    {
        $places=Places::count();
        $users=DB::table('users')->count();
        $categories=Category::count();
        $data=[
            'places'=>$places,
            'users'=>$users,
            'categories'=>$categories,

        ];
        //dd($data);

       return view('admin.dashboard',compact('data'));
    }

	/**users starts here */
	public function users()
    {
		$data=Listuser::orderby('id','desc')->get();

       return view('admin.professional.index',['data' => $data]);
    }

	public function add_user()
    {
       return view('admin.professional.add');
    }

	public function post_add_user(Request $request)
	{

	$validator = Validator::make($request->all(), [
            'email' => 'required|unique:users',
            'mobile' => 'required|unique:users|numeric|digits:10',
        ]);

        if($validator->fails()) {
            return redirect()->back()->withErrors($validator);
        }

		$create = Listuser::insert([
            "firstName" => $request->fname,
            "lastName" => $request->lname,
            "email" => $request->email,
            "mobile" => $request->mobile,
            "dateOfBirth" => $request->dob,
            "password" => $request->password,
        ]);

		if($create) {
			$msg = "Data added Successfully";
		} else {
			$msg = "Some error Occured.";
		}
			\Session::put('success',$msg);
			return redirect()->route('users');

	}

	public function delete_user($id)
    {
		Listuser::destroy($id);
		\Session::put('success','Data Deleted Successfully.');
	   	return redirect()->route('users');
	}


	public function viewUser($id)
    {
		$data = Listuser::find($id);
		// return $data;
	    return view('admin.professional.detail',['data' => $data]);
	}

	/**users ends here */


    /**category starts here */
    public function category()
    {
        $data = Category::all();
        return view('admin.category.index', ["data" => $data]);
    }

    public function postCategory(Request $request)
    {
        // return $request;
        $insert  = new Category;
        $insert->categoryName = $request->categoryName;
        $insert->save();

        if($insert) {
			$msg = "Data added Successfully";
		} else {
			$msg = "Some error Occured.";
		}

        \Session::put('success',$msg);
        return redirect()->route('category');

    }

    public function deleteCategory($id)
    {
        $delete = Category::destroy($id);
        if($delete) {
            $msg = "Deleted Successfully";
        } else {
            $msg = "Some error occured";
        }

        \Session::put('success',$msg);
        return redirect()->route('category');

    }
    /**category ends here */

    /**business starts here */
    public function places()
    {
        $places = Places::orderBy('id','desc')->paginate(10);
        return view('admin.places.index', compact('places'));
    }

    public function viewPlace($id)
    {
        $data=Places::with('categories')->find($id);
        $availibilty=User_availability::where('user_id',$id)->get(['start','end','day','is_open']);

        return view('admin.places.Detail', compact('data','availibilty'));

    }

    public function addPlace()
    {
        $categories = Category::pluck('categoryName','id');

        return view('admin.places.add', ['categories' => $categories]);
    }

    public function postPlace(Request $req)
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
            'mobile' => [
                'unique:places,mobile',
                'required',
                'digits:10',
                ],
            'website' => [
                'required',
                'regex:/^((https?|ftp|smtp):\/\/)?(www\.)?[a-z0-9]+(\.[a-z]+)+([\/][a-zA-Z0-9#]+\/?)*$/',
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


        // Generate a random password with uppercase letters, lowercase letters, numbers, and symbols in random order
        $uppercase = Str::random(2, 'uppercase');
        $lowercase = Str::random(2, 'lowercase');
        $numeric = Str::random(2, 'numeric');
        $special = Str::random(2, 'special');

        // Generate a random password with uppercase letters, lowercase letters, numbers, and symbols in random order
        $characters = $uppercase . $lowercase . $numeric . $special;
        $password = str_shuffle($characters);


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
        $place->password = Hash::make($password);
        $place->save();

        $categoryids = $req->category;

        $place->categories()->attach($categoryids);
        $details['email'] = $place->email;
        $details['password'] = $password;
        \Mail::to($place->email)->send(new \App\Mail\SendPassword($details));

        return redirect()->route('places');
    }

    public function deletePlace($id)
    {
        $place = Places::find($id);

        //dd($images);
        $place->categories()->detach();

        $images=Image::where('place_id',$id)->pluck('id');
        if (count($images)) {

           for ($i=0; $i <count($images) ; $i++) {
            $data=Image::find($images[$i]);
            $string_no = strpos($data->image,"public");
            //dd($str  $data=Image::find($id);ing_no);
            $new_image = substr($data->image,$string_no);
            $str = $data->image;
            $storage =  unlink($new_image);
               $data->delete();

           }


        }

        $availability=User_availability::where('user_id',$id)->delete();

        if ($place->image!=NULL) {
            $string_no = strpos($place->image,"public");
            //dd($str  $data=Image::find($id);ing_no);
            $new_image = substr($place->image,$string_no);
            $str = $place->image;
            //dd($place->image);
            $storage =  unlink($new_image);
        }

        $place->delete();

        return redirect()->route('places')->with('success', 'Place deleted successfully.');

    }

    /**business ends here */

	/**reviews starts here */

    public function reviews($placeId)
    {
        $data = Review::where('placeId', $placeId)->get();
        $placeName = Places::where('id', $placeId)->pluck('placeName');

        // return $placeName;
        return view('admin.review.index', ['data' => $data, 'placeName' => $placeName]);
    }


    public function deleteReview($id, $placeId)
    {
        $delete = Review::destroy($id);
        if($delete) {
            $msg = "Deleted Successfully";
        } else {
            $msg = "Some error occured";
        }

        \Session::put('success',$msg);
        return redirect()->route('reviews', ['placeId' => $placeId]);
    }

    /**reviews ends here */



	public function logout()
	{
	Auth::logout();
	Session::flush();
	return redirect(url('admin-login'));
	}

    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    function change_status(Request $request)
	{

		$proffstatus = $request->proffstatus;
		$id = $request->proff_id;


		$userprofile = Places::find($id);

		if ($userprofile->status == 0) {
			$userprofile->status = 1;
			$userprofile->save();
			echo '<span id="status_pending<?php echo $orderDetails->id; ?>" class="badge badge-info">approved</span>';
			exit();
		}

		if ($userprofile->status == 1) {
			$userprofile->status = 0;
			$userprofile->save();
			echo '<span id="status_approved<?php echo $orderDetails->id; ?>" class="badge badge-warning">pending</span>';
			exit();
		}
	}


}
