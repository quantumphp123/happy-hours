@extends('admin.layout.layout')
@section('content')
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Place Detail</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item ">Places</li>
                            <li class="breadcrumb-item active">Detail</li>
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
                    {{ Session::forget('success') }}
                </div>
            </div>
        @endif
        <section class="content">
            <div class="main-wrapper mx-4 my-2 d-flex justify-center">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header p-2">
                            <ul class="nav nav-pills">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#activity" data-toggle="tab">Basic</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#timeline" data-toggle="tab">Categories</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#settings" data-toggle="tab">Business Hours</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#details" data-toggle="tab">Marketing Details</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <div class="tab-content">
                                <div class="tab-pane active" id="activity">
                                    <div class="post">
                                        <div class="d-flex flex-row align-items-center">
                                            <img class="img-circle img-bordered-sm p-1" src="{{ $data->image }}" alt="{{ $data->placeName }}" width="100" height="100" style="margin-right:2rem;">
                                            <div class="d-flex flex-column">
                                                <h4>{{ $data->placeName }}</h4>
                                                <p class="text-muted">{{ $data->location }}</p>
                                            </div>
                                        </div>
                                        <p class="mt-3">{{ $data->description }}</p>
                                        <p>
                                        <p class=""><i class="fas fa-phone mr-1"></i> {{ $data->mobile }}</p>
                                        <p class=""><i class="far fa-envelope mr-1"></i> {{ $data->email }}</p>
                                        <span class="float-right">
                                            <p class="">
                                                <i class="far fa-location "></i>
                                            </p>
                                        </span>
                                        </p>
                                    </div>
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
                                            @foreach ($data->categories as $value)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
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
                                                <th>status</th>
                                                <th> Working Hours</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($availibilty as $value)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>{{ $value->day }}</td>
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
                                <div class="tab-pane" id="details">
                                    <div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="card-body">
                                            <p class="font-w600 mb-2 d-flex">
                                                <span class="custom-label-2"><strong><i class="fas fa-user"></i> Name : </strong></span>
                                                <span class="font-w400">&nbsp;&nbsp;{{ $data->marketing_name }}</span>
                                            </p>
                                            <p class="font-w600 mb-2 d-flex">
                                                <span class="custom-label-2"><strong><i class="fas fa-envelope mr-1"></i> Email : </strong></span>
                                                <span class="font-w400">&nbsp;&nbsp;{{ $data->marketing_email }}</span>
                                            </p>
                                            <p class="font-w600 mb-2 d-flex">
                                                <span class="custom-label-2"><strong><i class="fas fa-phone mr-1"></i> Phone :</strong></span>
                                                <span class="font-w400">&nbsp;&nbsp;{{ $data->marketing_phone }}</span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
