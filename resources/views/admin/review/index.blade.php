@extends('admin.layout.layout')
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
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Places</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
	
	@if (session('success'))
	<div class="card-body">
	<div class="alert alert-success alert-dismissible">
	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <h5>{{ Session::get('success') }}</h5>
	<?php Session::forget('success');?>
	</div>
    </div>
	@endif
	
	
	
	 <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
		  
		
            <div class=" card card-dark">
              <div class="card-header">
                <!-- <h3 class="card-title"><a href="{{url('add-place')}}"><button type="button" class="btn btn-block bg-gradient-primary">Add Place</button></a></h3> -->
                <h3 class="card-title">Place name: {{ $placeName[0] }}</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>S.No</th>
                    <th>Username</th>
                    <th>Rating</th>
                    <th>Message</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  
                  <tbody>
                    <?php  $i= 1; ?>
                    @foreach($data as $rows)
                      <tr>
                        <td>{{ $i }}</td>
                        <td>
                          <?php 
                            $uname = DB::table('users')->where('id', $rows->userId)->get();
                            if($uname) {
                              echo $uname[0]->firstName.' '.$uname[0]->lastName;
                            } else {
                              echo "Deleted user";
                            }
                          ?>
                        </td>
                        <td>{{ $rows->rating }}</td>
                        <td>{{ $rows->message }}</td>
                        <td><a href="{{ route('deleteReview', ['id' => $rows->id, 'placeId' => $rows->placeId] ) }}"  onclick="return confirm('are you sure?')">
                                <button class="btn btn-danger" type="button">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </a></td>
                      </tr>
                      <?php $i++; ?>
                    @endforeach
                  </tbody>

                  <tfoot>
                   <tr>
                    <th>S.No</th>
                    <th>Username</th>
                    <th>Rating</th>
                    <th>Message</th>
                    <th>Action</th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
			
			
			
			
			
			
			
			
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
	
	
  
  
   </div>
  @endsection