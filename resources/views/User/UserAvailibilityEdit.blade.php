@extends('User.layout.layout')
@section('content')
<style>
    .calendar-table{
        display:none;
    }
</style>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1> Update Business Hours</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Business Hours </li>
              <li class="breadcrumb-item active">Edit </li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

	@if ($errors->any())
	<div class="card-body">
	<div class="alert alert-danger alert-dismissible">
	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>

	@foreach ($errors->all() as $error)
	<p>{{ $error }}</p>
	@endforeach

	</div>


	</div>

	@endif
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- jquery validation -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Update {{$data->day}} Timing </h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form action="{{route('Availibility.Edit')}}" role="form" id="quickForm" method="post" enctype="multipart/form-data">
              @csrf
              <input type="hidden" name="id" value={{$data->id}}>
              <div class="card-body">
                  <div class="form-group">
                    <label for="start_hour1">Start</label>
                    <input type="text" name="start" class="form-control time_range" value="{{ date('h:i:s a m/d/Y', strtotime($data->start))}}" placeholder="Update start">
                  </div>

                  <div class="form-group">
                    <label for="exampleInputEmail1">End</label>
                    <input type="text" name="end" class="form-control time_range" value="{{ date('h:i:s a m/d/Y', strtotime($data->end))}}"  placeholder="Update End" required>
                  </div>


                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Update</button>
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

<script>
    $('.time_range').daterangepicker({
      timePicker: true,
      timePickerIncrement: 15,
      singleDatePicker: true,
      showDropdowns: true,
      timePicker12Hour: true,
      locale: {
        format: 'hh:mm a'
      }
    });
</script>
  @endsection
