<!-- Content Wrapper. Contains page content -->
@extends('User.layout.layout')
@section('content')
<br>
  <div class="content-wrapper">
     <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Change Password</h1>
                </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
               <li class="breadcrumb-item"><a href="{{route('User.Dashboard')}}">Home</a></li>
                <li class="breadcrumb-item active">Change Password</li>
              </ol>
            </div>

          </div>

          <br>
          @if(session('error'))
          <div class="alert bg-danger" role="alert">
            {{session('error')}}
            <button type="button" class="close text-white" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
          </div>
          @endif
          @if(session('success'))
          <div class="alert bg-primary" role="alert">
            {{session('success')}}
            <button type="button" class="close text-white" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
          </div>
          @endif
          <form method="post" action="{{route('user.change_pass.post')}}" id="change-password" name="change-password" enctype="multipart/form-data">
            @csrf         <div class="card-body row">

            <div class="col-md-12">

            	 <div class="form-group row mb-2">
	               <label for="text" class="col-sm-2 col-form-label">Current Password</label>
	               <div class="col-sm-10">
	                  <input type="password" class="form-control" id="current_password" name="current_password">
                      @error('current_password')
                      <span class="text-danger text-center mt-1">*{{$message}}</span>
                      @enderror
	               </div>

	            </div>
	            <div class="form-group row mb-2">
	               <label for="inputEmail3" class="col-sm-2 col-form-label">New Password</label>
	               <div class="col-sm-10">
	                  <input type="password" class="form-control" id="new_password" name="new_password" >
                      @error('new_password')
                      <span class="text-danger text-center mt-1">*{{$message}}</span>
                      @enderror
	               </div>
	            </div>
	            <div class="form-group row mb-2">
	               <label for="inputEmail3" class="col-sm-2 col-form-label">Confirm Password</label>
	               <div class="col-sm-10">
	                  <input type="password" class="form-control" id ="confirm_password" name="confirm_password">
                      @error('confirm_password')
                      <span class="text-danger text-center mt-1">*{{$message}}</span>
                      @enderror
	               </div>

	            </div>
	            <div class="row">
	               <div class="col-12">
	                  <div class="">
	                     <button type="submit" class="btn btn-info my-2" style="float:right;">Change Password</button>
	                  </div>
	               </div>
	            </div>

            </div>
         </div>
        </form>

        </div><!-- /.container-fluid -->
      </section>
  </div>
  @endsection
