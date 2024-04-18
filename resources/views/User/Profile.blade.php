


<!-- Content Wrapper. Contains page content -->
@extends('User.layout.layout')
@section('content')
<div class="modal" tabindex="-1" role="dialog" id="exampleModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Profile image</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="{{route('edit-pic')}}" method="POST" enctype="multipart/form-data">
              @csrf
            <input type="file" clas="form-control" name="image" required accept="image/x-png,image/gif,image/jpeg" />  
         
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
         </form>
      </div>
    </form>
    </div>
  </div>
</div>
<br>
  <div class="content-wrapper">
     <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>My Profile </h1>
                </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">Profile</li>
              </ol>
            </div>
          </div>
          <br>
          @if(session('update'))
<div class="alert bg-success" role="alert">
  {{session('update')}}
  <button type="button" class="close text-white" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
</div>
@endif
<div class="container-fluid">

  <!--        -->


<div class="">
<div class="card">
  <form method="POST" action="{{route('user.edit')}}" id="update-profile" name="update-profile" enctype="multipart/form-data">
    @csrf
            <input type="hidden" name="id" value={{$user->id}}>              
   <div class="card-body row">
          <div class="col-md-2">
                  <div class="profile-picture-container mr-4 p-4">
                      <div class="profile-picture-group">
                       
                      <img class="profile-picture"id="file-input"  src="{{$user->image}}" height="90" width="100" style="border-radius: 50%">
                      <a type="button" data-toggle="modal"   data-target="#exampleModal" class="px-2 btn-outline-none"style="color:black"> <i class="fa fa-edit" style="font-size:18px;"></i>edit pic</a> 
                      
                      </div>
                  </div>
          </div>
          <div class="col-md-10">
              
              <div class="form-group row mb-2">
              <label for="text" class="col-sm-2 col-form-label">Name</label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="name" name="name" value="{{$user->placeName}}">
              </div>
              </div>
              <div class="form-group row mb-2">
              <label for="inputEmail3" class="col-sm-2 col-form-label">Website</label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="email" name="website" value="{{$user->website}}" >
              </div>
              </div>
              
              
              <div class="form-group row mb-2">
                <label for="inputEmail3" class="col-sm-2 col-form-label">Marketing Person</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="email" name="marketing_name" value="{{$user->marketing_name}}" >
                </div>
                </div>
                <div class="form-group row mb-2">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">Marketing  Email</label>
                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="email" name="marketing_email" value="{{$user->marketing_email}}" >
                  </div>
                  </div>
                  <div class="form-group row mb-2">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Marketing  Phone</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="email" name="marketing_phone" value="{{$user->marketing_phone}}" >
                    </div>
                    </div>
                    
              <div class="form-group row mb-2">
              <label for="inputEmail3" class="col-sm-2 col-form-label">Location</label>
              <div class="col-sm-10">
<select name="location"class="form-control">

  
  <option value="Palm Springs" {{ $user->location == 'Palm Springs' ? 'selected' : '' }}>Palm Springs</option>
  <option value="Cathedral City"{{ $user->location == 'Cathedral City' ? 'selected' : '' }}>Cathedral City</option>
  <option value="Rancho Mirage"{{ $user->location == 'Rancho Mirage' ? 'selected' : '' }}>Rancho Mirage</option>
  <option value="Palm Desert"{{ $user->location == 'Palm Desert' ? 'selected' : '' }}>Palm Desert</option>
  <option value="Indian Wells"{{ $user->location == 'Indian Wells' ? 'selected' : '' }}>Indian Wells</option>
  <option value="Bermuda Dunes"{{ $user->location == 'Bermuda Dunes' ? 'selected' : '' }}>Bermuda Dunes</option>
  <option value="La Quinta"{{ $user->location == 'La Quinta' ? 'selected' : '' }}>La Quinta</option>
  <option value="Indio"{{ $user->location == 'Indio' ? 'selected' : '' }}>Indio</option>
  <option value="Coachella"{{ $user->location == 'Coachella' ? 'selected' : '' }}>Coachella</option>
    <option value="Dessert spring"{{ $user->location == 'Dessert spring' ? 'selected' : '' }}>Dessert spring</option>

</select>
              
             
              </div>
              </div>
                <label>Address</label>
                        <div class="row">
                        <div class="col-sm-2">
                        <div class="form-group">
                        <h6>Street Number</h6>
                        <input type="text" value="{{$user->streetnumber}}" class="form-control" name="streetnumber" placeholder="Enter Street Number">
                        </div>
                        </div>
                        <div class="col-sm-6">
                        <div class="form-group">
                        <h6>Street Name</h6>
                        <input type="text" class="form-control"name="streetname" value="{{$user->streetname}}"  placeholder="Enter Street Name" >
                        </div>
                        </div>
                        <div class="col-sm-4">
                        <div class="form-group">
                        <h6>Zip Code</h6>
                        <input type="text" class="form-control"name="zipcode" value="{{$user->zipcode}}"  placeholder="Enter ZipCode" >
                        </div>
                        </div>
                        </div>
                        
                        <div class="row">
                        <div class="col-sm-6">
        
                        <div class="form-group">
                        <h6 for="exampleInputEmail1">City</h6>
                        <div class="col-sm-6">
                        <select name="city"class="form-control">
                        <option value="Palm Springs" {{ $user->city == 'Palm Springs' ? 'selected' : '' }}>Palm Springs</option>
                          <option value="Cathedral City"{{ $user->city == 'Cathedral City' ? 'selected' : '' }}>Cathedral City</option>
                          <option value="Rancho Mirage"{{ $user->city == 'Rancho Mirage' ? 'selected' : '' }}>Rancho Mirage</option>
                          <option value="Palm Desert"{{ $user->city == 'Palm Desert' ? 'selected' : '' }}>Palm Desert</option>
                          <option value="Indian Wells"{{ $user->city == 'Indian Wells' ? 'selected' : '' }}>Indian Wells</option>
                          <option value="Bermuda Dunes"{{ $user->city == 'Bermuda Dunes' ? 'selected' : '' }}>Bermuda Dunes</option>
                          <option value="La Quinta"{{ $user->city == 'La Quinta' ? 'selected' : '' }}>La Quinta</option>
                          <option value="Indio"{{ $user->city == 'Indio' ? 'selected' : '' }}>Indio</option>
                          <option value="Coachella"{{ $user->city == 'Coachella' ? 'selected' : '' }}>Coachella</option>
                            <option value="Dessert spring"{{ $user->city == 'Dessert spring' ? 'selected' : '' }}>Dessert spring</option>
                        
                        </select>
						</div>
                        </div>
                        </div>
                        <div class="col-sm-6">
                        <div class="form-group">
                        <h6 for="exampleInputEmail1">Land-Mark</h6>
                        <input type="text" class="form-control"name="landmark" value="{{$user->landmark}}"  placeholder="Enter Land-Mark">
                        </div>
                        </div>
                        </div>
                    <div class="form-group row mb-2">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">Description</label>
                  <div class="col-sm-10">
                      <textarea class="form-control" oninput="countWord()" id="word" maxlength="300" name="description">{{$user->description}} </textarea>
                      <p align="right">
                                <span id="show">{{strlen($user->description)}}</span>
                                / 300
                    </p>
                  </div>
                            <script>
                                function countWord() {
                                    var words = document
                                        .getElementById("word").value;
                                    var count = words.length;
                                    document.getElementById("show")
                                        .innerHTML = count;
                                }
                            </script>
                  </div>
              
              <div class="row">
              <div class="col-12">
                  <div class="">
                      <button type="submit" class="btn btn-info mt-2" style="float:right;">Update</button>
                  </div>
              </div>
              </div>
              
          </div>
      </div>
  </form>
</div>
</div>	

</div>
      </section>
  </div>
  @endsection
