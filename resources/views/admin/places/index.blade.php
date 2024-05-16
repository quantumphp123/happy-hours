@extends('admin.layout.layout')
@section('content')
<style>
    .switch {
      position: relative;
      display: inline-block;
      width: 50px;
      height: 24px;

    }

    .switch input {
      display: none;
    }

    .slider {
      position: absolute;
      cursor: pointer;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background-color: gray;
      transition: 0.4s;
      border-radius:20px;
    }

    .slider:before {
      position: absolute;
      content: "";
      height: 20px;
      width: 20px;
      left: 2px;
      bottom: 2px;
      background-color: white;
      transition: 0.4s;
    }

    input:checked + .slider {
      background-color: #2196F3;
    }

    input:checked + .slider:before {
      transform: translateX(26px);
    }

    /* Optional: Customize the appearance */
    .slider:before {
      border-radius: 50%;
    }

    .slider:after {
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100%;
      width: 100%;
      text-transform: uppercase;
      font-size: 12px;
    }
    .table td, .table th {
        vertical-align: middle;
    }

</style>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Places</h1>
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

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-xl-12  d-flex justify-content-between">
                                        <div class="search-container mb-3">
                                            <div class="col-xl-12">
                                                <form action="{{ route('search-places') }}" method="GET" role="search" class="d-flex">
                                                    <input type="text" placeholder="Search..." name="search" class="form-control">
                                                    <button type="submit" class="btn btn-primary ml-2">
                                                        <i class="fa fa-search fa-sm"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                        <h3 class="card-title">
                                            <a href="{{ url('add-place') }}">
                                                <button type="button" class="btn btn-success bg-gradient-success"><i class="bi bi-plus-circle-fill"></i>&nbsp;Add Place</button>
                                            </a>
                                        </h3>
                                    </div>
                                </div>


                                @if (isset($searchTerm))
                                    <p class="ms-2">Search result for: <i class="text-primary">{{ $searchTerm }}</i></p>
                                @endif
                            </div>
                            <!-- /.card-header -->

                            @php
                                $startSerial = ($places->currentPage() - 1) * $places->perPage() + 1;
                            @endphp
                            <div class="card-body">
                                <div class="table table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>S.No.</th>
                                                <th>Name</th>
                                                <th>Location</th>
                                                <th>Categories</th>
                                                <th>Phone</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($places as $place)
                                                <tr>
                                                    <td>{{ $startSerial++ }}</td>
                                                    <td> {{ $place->placeName }} </td>
                                                    <td>{{ $place->location }}</td>
                                                    <td style="max-width: 250px;word-wrap: break-word;">
                                                        @foreach ($place->categories as $category)
                                                            {{ $category->categoryName . ', ' }}
                                                        @endforeach
                                                    </td>
                                                    <td> {{ $place->mobile }} </td>
                                                    <td>
                                                        <label class="switch">
                                                            <input type="checkbox" class="status-switch"
                                                                data-status="{{ $place->status }}"
                                                                data-proff-id="{{ $place->id }}"
                                                                {{ $place->status == '1' ? 'checked' : '' }}>
                                                            <span class="slider"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex  align-items-center justify-content-between">
                                                            <a href="{{ route('admin.place.show', ['id' => $place->id]) }}" role="button" class="btn btn-sm btn-warning mx-2 text-white">
                                                                <i class="bi bi-eye-fill"></i>
                                                            </a>
                                                            <a href="{{ route('deletePlace', ['id' => $place->id]) }}" role="button" class="btn btn-sm btn-danger mx-2" onclick="return confirm('Are you sure want to delete?')">
                                                                <i class="bi bi-trash-fill"></i>
                                                            </a>
                                                            <a href="{{ route('reviews', ['placeId' => $place->id]) }}" role="button" class="btn bg-gradient-info btn-sm">
                                                                Reviews
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endforeach

                                        </tbody>

                                    </table>
                                    <div class="d-flex  align-items-center justify-content-center"
                                        <div class="pagination">
                                            {{ $places->links() }}
                                        </div>
                                    </div>
                                </div>
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
            <script>
                $(document).ready(function() {
                    $('.status-switch').change(function() {
                        var status = $(this).data('status');
                        var proff_id = $(this).data('proff-id');

                        $.ajax({
                            url: '{{ url('change-status') }}',
                            method: 'POST',
                            data: {
                                status: status,
                                proff_id: proff_id,
                                '_token': "{{ csrf_token() }}"
                            },
                            success: function(data) {
                                // Handle success response
                            }
                        });
                    });
                });

            </script>
        </section>
    </div>
@endsection
