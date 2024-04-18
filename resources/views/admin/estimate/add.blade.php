@extends('admin.layout.layout')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Add Job</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Add Job</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- jquery validation -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Add Job</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form action="{{url('post-add-estimate')}}" role="form" id="quickForm">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Job Heading</label>
                    <input type="text" name="text" class="form-control" placeholder="Enter Heading">
                  </div>
				  
				  <div class="form-group">
                    <label for="exampleInputEmail1">Job Amount</label>
                    <input type="text" name="Amount" class="form-control"  placeholder="Enter Amount">
                  </div>
				  
				  <div class="form-group">
                  <label>Job Type</label>
                  <select class="form-control select2bs4" style="width: 100%;">
                    
                    <option>House Interior</option>
                    <option>Fixed</option>
                    <option>Architect</option>
                    <option>Basement Renovation</option>
                    <option>Catering service</option>
                    <option>Washington</option>
                  </select>
                </div>
				  
				   <div class="form-group">
                    <label for="exampleInputEmail1">Address</label>
                    <input type="text" name="Address" class="form-control"  placeholder="Enter Address">
                  </div>
				 
				  <div class="form-group">
                    <label for="exampleInputEmail1">Location</label>
                    <input type="text" name="Address" class="form-control"  placeholder="Enter Postal Code">
                  </div>
				  
				  
                  <div class="form-group">
                    <label for="exampleInputPassword1">Project Detail</label>
                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Project Detail">
                  </div>
				  
				  <div class="form-group">
                  <label>Skill Required</label>
                  <select class="form-control select2bs4" style="width: 100%;">
                    
                    <option>Applience install</option>
                    <option>Applience Repair</option>
                    <option>Architect</option>
                    <option>Basement Renovation</option>
                    <option>Catering service</option>
                    <option>Washington</option>
                  </select>
                </div>
                 
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
              </form>
            </div>
            <!-- /.card -->
            </div>
          <!--/.col (left) -->
          <!-- right column -->
          <div class="col-md-6">

          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  
  @endsection