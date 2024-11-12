<!-- Content Wrapper. Contains page content -->
@extends('User.layout.layout')
@section('content')
<br>
  <div class="content-wrapper">
     <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Details</h1>
                </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="{{route('User.Dashboard')}}">Home</a></li>
                <li class="breadcrumb-item active">Details</li>
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
          <div class="alert bg-success" role="alert">
            {{session('success')}}
            <button type="button" class="close text-white" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
          </div>
          @endif
          <form class="form-horizontal" name="updateServices"  action="{{route('details.update')}}" method="POST">
            @csrf
            <div class="card-body" style="font-size:20px;" id="input-card-body">
               @foreach($services as $service)
               <div class="row" id="row">
                <div class="col-sm-10">
                <div class="form-group">
                    <label for="exampleInputEmail1"></label>
                    <input type="text" name="services[]" class="form-control" value="{{ $service }}">
                </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                    <button class="btn btn-danger" id="remove" type="button" ><i class="fas fa-trash"></i></button>
                    </div>
                    </div>
                </div>
               @endforeach
                </div>
                 <div class="card-body">
                    <button class="btn btn-success btn-xs mt-3 sharp" id="add" type="button"><i class="fas fa-plus"></i></button>
                </div>
                
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                            <script type="text/javascript">
                                $(document).ready(function() {
                                    $("#add").click(function () {
                                        newCustomAmount = `
                                        <div class="row" id="row">
                                        <div class="col-sm-10">
                                        <div class="form-group">
                                                <label for="exampleInputEmail1"></label>
                                                    <input type="text" class="form-control" id="service" name="services[]" >
                                            </div>
                                            </div>
                                            <div class="col-sm-2">
                                            <div class="form-group">
                                            <button class="btn btn-danger" id="remove" type="button" ><i class="fas fa-trash"></i></button>
                                        </div>
                                        </div>
                                        </div>`;
                                        console.log(newCustomAmount);
                                        $('#input-card-body').append(newCustomAmount);
                                    });
                            
                                    $("body").on("click", "#remove", function () {
                                        $(this).parents("#row").remove();
                                    });
                                });
                </script>
                
               <div class="card-body">
                        <button type="submit" class="btn btn-info m-2 px-4" style="float:left;">Update</button>

               </div>
         </form>


        </div><!-- /.container-fluid -->
      </section>
  </div>
  @endsection
