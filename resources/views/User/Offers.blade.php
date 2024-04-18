<!-- Content Wrapper. Contains page content -->

@extends('User.layout.layout')
@section('content')


 

  <div class="content-wrapper">
     <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Offers</h1>
                </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="{{route('User.Dashboard')}}">Home</a></li>
                <li class="breadcrumb-item active">Offers</li>
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
        <div class="card-header">
        <h4 class="card-title">Offers</h4>
        <a class="float-right btn btn-primary" href="{{route('offer.create')}}">Add a Offer</a>
        </div>
        <div class="card-body">
            @if($offers->count())
            <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>S.No</th>
                  <!-- <th>Image</th> -->
                  <th>Offer</th>
                  <th>Image</th>
                  <th>Action</th>
                  {{-- <th>Last Name</th>
                  <th>Email</th>
                  <th>Mobile</th>
                  --}}
                </tr>
                </thead>
                <tbody>

                  @foreach($offers as $key=>$value)
                  <tr>
                    <td>{{$key+1}}</td>
                    <td class="text-capitalize"> {{$value->description}} </td>

                  
                    @if($value['Image'])
                    <td><img src="{{$value->Image}}" alt="" height=50 width=100></td>
                    @else
                    <td> No image to show!</td>
                    @endif

                        <td>
                            <a href="{{ route('Offer.Delete', ['id' => $value->id] ) }}">
                                <button class="btn btn-danger" type="button">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </a>
                            
                            @if($value->is_notified == 1)
<button class="btn btn-secondary" type="button" >
                                     notified
                               
                            </button>
                            @else
                            <a href="{{route('SendNotification',['id' => $value->id] )}}" >
                                <button class="btn btn-primary" type="button">
                                      notify
                                </button>
                            </a>
@endif
                      </td>


                  </tr>

                  @endforeach

                </tbody>
                <tfoot>
                 <tr>
                  <th>S.No</th>
                            <!-- <th>Image</th> -->
                  <th>Offer</th>
                  <th>Image</th>
                  <th>Action</th>
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
        <p class="d-flex justify-content-center font-bold">no offers to show</p>
@endif
        </div>
        </div>
        </div>


        </div><!-- /.container-fluid -->
      </section>
  </div>
  @endsection


