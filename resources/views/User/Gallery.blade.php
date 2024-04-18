<!-- Content Wrapper. Contains page content -->
@extends('User.layout.layout')
@section('content')
<style>
  .fa-trash{
      position: relative;
      bottom:14%;
      padding-right:6px;
      color:red;


  }
</style>
<div  class="modal" tabindex="-1" role="dialog" id="imagepreview">
    <div class="modal-dialog" role="document">
<div class="modal-content">
    <div class="modal-header">
        <h4 class="modal-title">Image preview</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
    </div>
    <div class="modal-body">
        <div class="ekko-lightbox-container" style="height: 589px;">
        <div class="ekko-lightbox-item fade"></div><div class="ekko-lightbox-item fade in show">
            <img  class="img-fluid" id="preview-img" style="width: 150%; height:70%">
        </div><div class="ekko-lightbox-nav-overlay">
            <a href="#">
                <span></span></a><a href="#"><span></span></a></div></div></div><div class="modal-footer hide" style="display: none;">&nbsp;</div>
            </div>
        </div>
    </div>
<div class="modal" tabindex="-1" role="dialog" id="exampleModal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Add Images</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form action="{{route('image.upload')}}" method="post" enctype="multipart/form-data">
              @csrf
<input type="file" name="image[]" multiple required>

                      <div class="card-body">
                      </div>



        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Add</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
              <h1>Gallery</h1>
                </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="{{route('User.Dashboard')}}">Home</a></li>
                <li class="breadcrumb-item active">Gallery</li>
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


       <div class="col-12">
        <div class="card card-primary">
        <div class="card-header">
        <h4 class="card-title">User Gallery</h4>
        <button class="float-right btn btn-primary"data-toggle="modal" data-target="#exampleModal">Add  Images</button>
        </div>
        <div class="card-body">
            @if($images->count())
        <div class="row">
               @foreach($images as $key=>$value)
               <div class="col-sm-2">
                <a href="#" data-toggle="modal" onclick="preview(this); return false;"  data-id='{{$value}}' data-target="#imagepreview"  data-gallery="gallery">
                <img src="{{$value}}" class="img-fluid mb-2" style="height:150px;" alt="image">
                <a href="{{route('UserImage.Delete',['id'=>$key])}}"><i class="fa fa-trash  float-right mb-2 "></i></a>
                <br>
                </a>
                </div>

               @endforeach
        </div>
        @else
        <br>
        <p class="d-flex justify-content-center font-bold">no image to show</p>
@endif
        </div>
        </div>
        </div>


        </div><!-- /.container-fluid -->
      </section>
  </div>
  @endsection
<script>

function preview(e){
    var id = e.getAttribute('data-id');
    document.getElementById('preview-img').src=id;

}


    //$(document).on("click", "#imagepreview", function () {

    // ;
     // As pointed out in comments,
     // it is unnecessary to have to manually call the modal.
     // $('#addBookDialog').modal('show');
//});
    </script>
