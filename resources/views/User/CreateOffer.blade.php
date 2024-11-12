@extends('User.layout.layout')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Add Offer</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('User.Dashboard')}}">Home</a></li>
              <li class="breadcrumb-item active">Add Offer</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
<style>
    
    #the-count {
  float: right;
  padding: 0.1rem 0 0 0;
  font-size: 0.875rem;
}
</style>
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
                <h3 class="card-title">Add Details</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form action="{{route('Offer.post')}}" role="form" id="quickForm" method="post" enctype="multipart/form-data">
              @csrf
              <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Offer Heading*</label>
                    <input type="text" name="heading" class="form-control" placeholder="Enter Offer heading" required>
                  </div>

                

              

                  <div class="form-group">
                    <label for="exampleInputEmail1">Offer Description*</label>
                    <textarea  maxlength="40"  name="desc" class="form-control" placeholder="Enter Offer description " required></textarea>
                    
                    <div id="the-count">
    <span id="current">0</span>
    <span id="maximum">/ 40</span>
  </div>
                  </div>

                  <div class="form-group">
                    <label for="exampleInputEmail1">Banner Image*</label>
                    <input type="file" name="image" class="form-control px-1" required accept="image/png, image/gif, image/jpeg">
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
@section('script')
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>

    $("textarea").keyup(function () {
  var characterCount = $(this).val().length,
    current = $("#current"),
    maximum = $("#maximum"),
    theCount = $("#the-count");

  current.text(characterCount);

  /*This isn't entirely necessary, just playin around*/
  if (characterCount < 70) {
    current.css("color", "#666");
  }
  if (characterCount > 30 && characterCount <=40) {
    current.css("color", "#FF0000");
  }
  if (characterCount > 90 && characterCount < 100) {
    current.css("color", "#793535");
  }
  if (characterCount > 100 && characterCount < 120) {
    current.css("color", "#841c1c");
  }
  if (characterCount > 120 && characterCount < 139) {
    current.css("color", "#8f0001");
  }

  if (characterCount >= 140) {
    maximum.css("color", "#8f0001");
    current.css("color", "#8f0001");
    theCount.css("font-weight", "bold");
  } else {
    maximum.css("color", "#666");
    theCount.css("font-weight", "normal");
  }
});
</script>

@endsection