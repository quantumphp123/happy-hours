<!-- Content Wrapper. Contains page content -->
@extends('User.layout.layout')
@section('content')
<style>
    
    .img{
        width:200px;
    }
</style>
    <?php
    $images = $images->toArray();
    ?>
    <div class="content-wrapper" style="min-height: 2646.8px;">

        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Profile</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="">Home</a></li>
                            <li class="breadcrumb-item active">Profile</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">

                        <div class="card card-primary card-outline">
                            <div class="card-body box-profile">
                                <div class="text-center">
                                    <img class="profile-user-img img-fluid img-circle" src="{{ $data->image }}"
                                        alt="User profile picture">
                                </div>
                                <h3 class="profile-username text-center"> {{ $data->placeName }}</h3>
                                <p class="text-muted text-center"><i class="fas fa-map-marker-alt mr-1"> </i>
                                    {{ $data->location }}</p>
                                <p class="text-muted text-center"><i class="fas fa-globe mr-1"> </i> <a
                                        href="{{ $data->website }}">Website</a> </p>
                                <ul class="list-group list-group-unbordered mb-3">
                                    <li class="list-group-item">
                                        <strong style="color:#212529">Business Phone</strong>
                                        <p class="float-right text-primary">{{ $data->mobile }}</p>
                                    </li>
                                      <li class="list-group-item d-flex justify-content-between align-items-start">
                                    <b style="color:#212529; white-space: nowrap;">Business Email</b>
                                    <p class="text-primary mb-0 text-wrap" style="margin-left: 10px;">{{ $data->email }}</p>
                                </li>

                                    <li class="list-group-item">
                                        <b style="color:#212529">Ratings</b>
                                        <p class="float-right text-primary">{{ $data->ratings }}/5</p>
                                    </li>
                                </ul>

                            </div>

                        </div>


                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Marketing Contact Details</h3>
                            </div>

                            <div class="card-body">
                                <strong><i class="fas fa-user mr-1"></i> Name</strong>
                                <p class="text-muted">
                                    {{ $data->marketing_name }}
                                </p>
                                <hr>
                                <strong><i class="fas fa-phone mr-1"></i> Phone</strong>
                                <p class="text-muted">
                                    {{ $data->marketing_phone }}
                                </p>
                                <hr>

                                <strong><i class="fas fa-envelope mr-1"></i> Email</strong>
                                <p class="text-muted">{{ $data->marketing_email }}</p>
                                <hr>

                            </div>

                        </div>

                    </div>

                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-header p-2">
                                <ul class="nav nav-pills">
                                    <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">Images</a>
                                    </li>
                                    <li class="nav-item"><a class="nav-link" href="#timeline"
                                            data-toggle="tab">Categories</a>
                                    </li>
                                    <li class="nav-item"><a class="nav-link " href="#settings"
                                            data-toggle="tab">Business
                                            Hours</a></li>
                                </ul>
                            </div>
                            <div class="card-body">
                                
                                <div class="tab-content">
                                  
                                    <div class="tab-pane active" id="activity">
                                        @if(count($images))
                                        <div class="post">
                                            <div class="row mb-3 gallerys">
                                                <div class="col-sm-6">
                                                   <a href="{{ $images[0] }}" target="_blank" > <img class="img-fluid" style="height:320px;"  src="{{ $images[0] }}" alt="Photo"></a>
                                                </div>

                                                <div class="col-sm-6">
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            @if (array_key_exists(2, $images))
                                                                  <a href="{{ $images[1] }}" target="_blank" >
                                                                <img class="img-fluid mb-3 img" src={{ $images[1] }}
                                                                    alt="Photo" style="height:150px;">
                                                                    </a>
                                                            @endif
                                                            @if (array_key_exists(2, $images))
                                                                 <a href="{{ $images[2] }}" target="_blank" > <img class="img-fluid img" src={{ $images[2] }}
                                                                    alt="Photo" style="height:150px;"></a>
                                                            @endif
                                                        </div>


                                                        <div class="col-sm-6">
                                                            @if (array_key_exists(3, $images))
                                                                  <a href="{{ $images[3] }}" target="_blank" ><img class="img-fluid mb-3 img" src={{$images[3]}}
                                                                    alt="Photo" style="height:150px;"></a>
                                                            @endif
                                                            @if (array_key_exists(4, $images))
                                                                  <a href="{{ $images[4] }}" target="_blank" ><img class="img-fluid img" src={{$images[4]}}
                                                                    alt="Photo" style="height:150px;" ></a>
                                                            @endif
                                                        </div>

                                                    </div>

                                                </div>

                                            </div>

                                           
                                        </div>
@endif
                                    </div>

                                    <div class="tab-pane" id="timeline">


                                        <div>

                                        </div>






                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>S.No</th>
                                                    <th> Category</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($data->categories as $key => $value)
                                                    <tr>

                                                        <td>{{ $key + 1 }}</td>
                                                        <td>{{ $value['categoryName'] }}</td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>S.No</th>
                                                    <th>Category</th>

                                                </tr>
                                            </tfoot>
                                        </table>






                                    </div>
                                    <div class="tab-pane" id="settings">
                                        <div>

                                        </div>






                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>S.No</th>
                                                    <th> Day</th>
                                                    <th>Status</th>
                                                    <th> Working Hours</th>


                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($availibilty as $key => $value)
                                                    <tr>
                                                        <td>{{ $key + 1 }}</td>
                                                        <td class="text-capitalize">{{ $value->day }}</td>
                                                        @if ($value->is_open == 0)
                                                            <td> <button class="btn btn-danger">Close</button></td>
                                                        @else
                                                            <td> <button class="btn btn-success">Open</button> </td>
                                                        @endif
                                                        <td>{{ $value->start }}-{{ $value->end }}</td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>S.No</th>
                                                    <th> Day</th>
                                                    <th>status</th>
                                                    <th> Working Hours</th>
                                                </tr>
                                            </tfoot>
                                        </table>

                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    </section>
@endsection
@section('script')

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.css" integrity="sha512-WEQNv9d3+sqyHjrqUZobDhFARZDko2wpWdfcpv44lsypsSuMO0kHGd3MQ8rrsBn/Qa39VojphdU6CMkpJUmDVw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.js" integrity="sha512-C1zvdb9R55RAkl6xCLTPt+Wmcz6s+ccOvcr6G57lbm8M2fbgn2SUjUJbQ13fEyjuLViwe97uJvwa1EUf4F1Akw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>

 $(document).ready(function() {
        $('.gallerys').magnificPopup({
            type: 'image',
            delegate: 'a',
            gallery: {
                enabled: true
            }
        });
    });

//function preview(e){
//    var id = e.getAttribute('data-id');
//    document.getElementById('preview-img').src=id;
//
//}


    //$(document).on("click", "#imagepreview", function () {

    // ;
     // As pointed out in comments,
     // it is unnecessary to have to manually call the modal.
     // $('#addBookDialog').modal('show');
//});
    </script>
@endsection
