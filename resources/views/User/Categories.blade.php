<!-- Content Wrapper. Contains page content -->
@extends('User.layout.layout')
@section('content')
<br>
  <div class="content-wrapper">
     <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Category</h1>
                </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="{{route('User.Dashboard')}}">Home</a></li>
                <li class="breadcrumb-item active">Category</li>
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
          <form class="form-horizontal" name="updateServices" id="updateServices" action="{{route('Category.update')}}" method="POST">
            @csrf
            <div class="card-body row" style="font-size:20px;">
               @foreach($categories as $key => $value)
               @if($loop->iteration<($loop->last)/2)
               <div class="col-md-6 custom-control custom-checkbox">
                  <input class="custom-control-input" type="checkbox" id="ser_{{$key}}" name ="categories[]" value="{{$key}}" {{in_array($key,$Placecategories) ? 'checked':''}}  >
                  <label for="ser_{{$key}}" class="custom-control-label">{{$value}}</label>
               </div>
               @else
               <div class="col-md-6 custom-control custom-checkbox">
                  <input class="custom-control-input" type="checkbox" id="ser_{{$key}}" name = "categories[]" value="{{$key}}" {{in_array($key,$Placecategories) ? 'checked':''}}  >
                  <label for="ser_{{$key}}" class="custom-control-label">{{$value}}</label>
               </div>
               @endif
               @endforeach
               <br>
               <label style="color: rgb(255, 0, 0);"><label id="services[]-error" class="error" for="categories[]" style="display: none;"></label></label>
               <div class="row">
                  <div class="col-12">

<br>
                        <button type="submit" class="btn btn-info m-2 px-4" style="float:left;">Update</button>

                  </div>
               </div>
            </div>
         </form>


        </div><!-- /.container-fluid -->
      </section>
  </div>
  @endsection
