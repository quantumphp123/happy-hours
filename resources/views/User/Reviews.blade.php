<!-- Content Wrapper. Contains page content -->

@extends('User.layout.layout')
@section('content')




  <div class="content-wrapper">
     <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Reviews</h1>
                </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="{{route('User.Dashboard')}}">Home</a></li>
                <li class="breadcrumb-item active">Reviews</li>
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

          @if(session('delete'))
          <div class="alert bg-danger" role="alert">
            {{session('delete')}}
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

        <div class="card-body">
            @if($reviews->count())
   <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>S.No</th>
                  <!-- <th>Image</th> -->
                  <th>Review</th>
                  <th>User</th>
                  <th>Rating</th>

                  {{-- <th>Last Name</th>
                  <th>Email</th>
                  <th>Mobile</th>
                  --}}
                </tr>
                </thead>

                <tbody>

                  @foreach($reviews as $key=>$value)
                  <tr>
                    <td>{{$key+1}}</td>
                    <td class="text-capitalize"> {{$value->message}} </td>

                    <?php
                    $userName= DB::table('users')->where('id',$value->userId)->get(['firstName','lastname']);
                     ?>

                    <td class="text-capitalize" >{{$userName[0]->firstName}} {{$userName[0]->lastname}}</td>

                    <td  >{{$value->rating}}/5</td>


                  </tr>

                  @endforeach

                </tbody>
                <tfoot>
                 <tr>
                    <th>S.No</th>
                    <!-- <th>Image</th> -->
                    <th>Review</th>
                    <th>User</th>
                    <th>Rating</th>

                  {{-- <th>Last Name</th>
                  <th>Email</th>
                  <th>Mobile</th>
                <!-- <th>Status</th>
                <th>Registered Date</th> -->
                  --}}
                </tr>
                </tfoot>
              </table>
        @else
        <br>
        <p class="d-flex justify-content-center font-bold">no reviews to show</p>
@endif
        </div>
        </div>
        </div>


        </div><!-- /.container-fluid -->
      </section>
  </div>
  @endsection


