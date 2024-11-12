<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Support\Facades\Http;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Listuser;

class SocialController extends Controller
{
    //

    public function Glogin(Request $request)
    {


            // $url = "https://www.googleapis.com/oauth2/v3/userinfo";
            /*
            Android dev are providing us id_token from their app
            */
            $url = "https://oauth2.googleapis.com/tokeninfo";
            $response = Http::get($url, [
                'id_token' => $request->code,
            ]);

            if(!$response->ok()) {
                return response()->json([
                    "response_code" => 402,
                    "response_message" => "Invalid Access Token"
                ], 402);
            } else {
                $email = $response['email'];
                // $email = $response->email;
                $exists = DB::table('users')->where('email', $email)->exists();
                if($exists) {
                    $email = DB::table('users')->where('email', $email)->get();
                    
                    $user = Listuser::find($email[0]->id);
                   
                    $data['user']=$user;
                     $data['token'] = $user->createToken('api-token')->plainTextToken;
                    return response()->json([
                        "response_code" => 200,
                        "response_message" => "Ok",
                        "success" => $data
                    ], 200);
                } else {
                            $length = 50;
                            $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
                            $charactersLength = strlen($characters);
                            $randomString = '';

                            for ($i = 0; $i < $length; $i++) {
                                $randomString .= $characters[rand(0, $charactersLength - 1)];
                            }

                            // $randomString;

                            function random_password( $lengthh = 12 ) {
                                $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_-=+;:,.?";
                                $password = substr( str_shuffle( $chars ), 0, $lengthh );
                                return $password;
                            }
                            $pass = random_password();
                            $id = DB::table('users')-> insertGetId(array(
                                'firstName'=> $response['given_name'],
                                'lastName'=>$response['family_name'],
                                'email'=>$response['email'],
                                'password'=>$pass,
                                'provider_id' => $response['sub'],
                                'provider_name' => 'GOOGLE'
                                // 'fr' => $response['picture']
                            ));
                            $user = Listuser::find($id);
                            $data['user']=$user;
                            $data['token'] = $user->createToken('api-token')->plainTextToken;
							/*
                            $success['id'] =  $userinfo[0]->id;
                            $success['name'] =  $userinfo[0]->name;
                            $success['email'] =  $userinfo[0]->email;
                            $success['contact'] =  $userinfo[0]->contact;
                            $success['password'] = $userinfo[0]->password;
                            $success['dob'] =  $userinfo[0]->dob;
                            $success['payment_status'] =  $userinfo[0]->payment_status;
                            $success['token'] =  $userinfo[0]->token;
                            $success['height'] =  $userinfo[0]->height;
                            $success['weight'] =  $userinfo[0]->weight;
                            $success['frontshot'] =  $userinfo[0]->frontshot;
                            $success['backshot'] =  $userinfo[0]->backshot;
                            $success['provider_id'] =  $userinfo[0]->provider_id;
                            $success['provider_name'] =  $userinfo[0]->provider_name;
                            $success['cover_pic'] =  $userinfo[0]->cover_pic;
							$success['current_shot'] =  $userinfo[0]->current_shot;
                            */


                            return response()->json([
                                "response_code" => 201,
                                "response_message" => "Ok",
                                "success" => $data
                            ], 201);
                    }

            }

    }

    /**
     * only for generating access codes
     */
    public function GloginCallback(Request $request)
    {

            $Gdriver = Socialite::driver('google');
            try{
                $tokens = $Gdriver->stateless()->getAccessTokenResponse($request->code);
            } catch(\GuzzleHttp\Exception\RequestException $e) {
                throw new \ErrorException("Try again with new access code");
            }

            $access_token = $tokens['access_token'];

            $url = "https://www.googleapis.com/oauth2/v3/userinfo";
            $response = Http::get($url, [
                'access_token' => $access_token,
            ]);

            if(!$response->ok()) {
                throw new \ErrorException('Access token expired. try again');
            }

            // return view('json', ['data'=> $response]);
            return $response->json();

    }

    /* for generating access code only */

public function Flogin(Request $request)
    {


        if(empty($request->token)) {
            return response()->json([
                "response_code" => 401,
                "response_message" => "Access Token is mandatory"
            ], 401);
        }

        $fb_access_token = $request->token;

        $user = Socialite::driver('facebook')->userFromToken($fb_access_token);
		//dd($user);exit;

        /*$myfile = fopen(public_path('logs.txt'), "w");
		fwrite($myfile, $user);
		fclose($myfile);
		exit;
        return $request;*/

		if(!$user) {
            return response()->json([
                "response_code" => 402,
                "response_message" => "Invalid Access Token"
            ], 402);
        } else {


                $data['id'] = $user->getId();
                $data['name'] = $user->getName();
                $data['email'] = $user->getEmail();
                //$data['phone']=$user->getPhone();
                $data['avatar'] = $user->getAvatar();
                
                
                $fullname=$data['name'];
                
                $nameArr=explode(" ",$fullname);
                 
                 $fname=$nameArr[0];
                 $lname='';
                 
                if(count($nameArr)>1){
                   $lname=$nameArr[1];
                }
            
                $email = $data['email'];
                $provider_id= $data['id'];
                
                $exists = DB::table('users')->where('email', $email)->exists();
                $exist_id=DB::table('users')->where('provider_id', $provider_id)->exists();
                 
                 if(!$email && $exist_id) {
                    
                  $data = DB::table('users')->where('provider_id', $provider_id)->get();
                   
                    
                    $user = Listuser::find($data[0]->id);
                   
                    $data['user']=$user;
                     $data['token'] = $user->createToken('api-token')->plainTextToken;
                    return response()->json([
                        "response_code" => 200,
                        "response_message" => "Ok",
                        "success" => $data
                    ], 200); 
                }
                
                else{
                       if($exists) {
                     $data = DB::table('users')->where('email', $email)->get();
                    
                    $user = Listuser::find($data[0]->id);
                   
                    $data['user']=$user;
                     $data['token'] = $user->createToken('api-token')->plainTextToken;
                    return response()->json([
                        "response_code" => 200,
                        "response_message" => "Ok",
                        "success" => $data
                    ], 200);
                } 
                else {
                    $length = 50;
                    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
                    $charactersLength = strlen($characters);
                    $randomString = '';

                    for ($i = 0; $i < $length; $i++) {
                        $randomString .= $characters[rand(0, $charactersLength - 1)];
                    }

                    // $randomString;

                    function random_password( $lengthh = 12 ) {
                        $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_-=+;:,.?";
                        $password = substr( str_shuffle( $chars ), 0, $lengthh );
                        return $password;
                    }


                            $pass = random_password();
                            $id = DB::table('users')->insertGetId(array(
                                
                                'firstName'=>$fname,
                                'lastName'=>$lname,
                                'email'=>$data['email'],
                                'password'=>$pass,
                                'provider_id' => $data['id'],
                                'provider_name' => 'FACEBOOK',
                                'imagePath' => $data['avatar']
                            ));
                             $user = Listuser::find($id);
                            $data['user']=$user;
                            $data['token'] = $user->createToken('api-token')->plainTextToken;
                            
                            return response()->json([
                                "response_code" => 201,
                                "response_message" => "Ok",
                                "success" => $data
                            ], 200);
                }
                    
                }
                
             
        }

    }




}
