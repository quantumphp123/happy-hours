@extends('admin.layout.layout')
@section('content')
  <div class="content-wrapper">
  
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Categories</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Categories</li>
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
		  
		
            <div class="card">
              <div class="card-header">
                <h3 class="card-title"><a href="{{url('add-category')}}"><button type="button" class="btn btn-block bg-gradient-primary">ADD Categories</button></a></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>S.No</th>
                    <!-- <th>Image</th> -->
                    <th>Category</th>
                    <th>Action</th>
                    {{-- <th>Last Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    --}}
                  </tr>
                  </thead>
                  <tbody>
                    <?php $i = 1; ?>
                    @foreach($data as $rows)
                    <tr>
                      <td>{{$i}}</td>
                      <td> {{$rows->categoryName}} </td>
                      <td>
                            <a href="{{ route('deleteCategory', ['id' => $rows->id] ) }}"  onclick="return confirm('Are you sure want to delete?')">
                                <button class="btn btn-danger" type="button">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </a>
                      </td>
                      {{-- <td> {{$rows->lastName}} </td>
                      <td> {{$rows->email}} </td>
                      <td> {{$rows->mobile}} </td>
                      <td>  
                                <button  class="btn btn-primary" type="button" data-toggle="modal" data-target="#userDetail{{$i}}" >  
                                    <i class="fa fa-eye"></i>
                                </button>
                                <!-- Modal -->
                                <div class="modal fade" id="userDetail{{$i}}" tabindex="-1" role="dialog" aria-labelledby="userDetail" aria-hidden="true">
                                  <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">User Details</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                        </button>
                                      </div>
                                      <div class="modal-body">
                                        <div id="modal-detail">
                                          <div class="row">
                                            <div class="col">
                                              <p>
                                                First Name: 
                                              </p>
                                              <p>
                                                Last Name: 
                                              </p>
                                              
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Save changes</button>
                                      </div>
                                    </div>
                                  </div>
                                </div>

                            
                      </td>--}}
                    </tr>
                    <?php $i++; ?>
                    @endforeach
                  
                  </tbody>
                  <tfoot>
                   <tr>
                    <th>S.No</th>
					          <!-- <th>Image</th> -->
                    <th>Category</th>
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