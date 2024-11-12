<?php
function ConvertTime($time)
{
    $pos = strpos($time, ':');
    $min = substr($time, $pos);
    $hr = substr($time, 0, 2);
    $suffix = 'AM';
    if ($hr == '00') {
        $hr = 12;
    }
    if ($hr - 12 > 0) {
        $hr -= 12;
        $suffix = 'PM';
    }
    return "$hr$min $suffix";
}
?>
<!-- Content Wrapper. Contains page content -->
@extends('User.layout.layout')
@section('content')
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Business Hours</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{{ route('User.Dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item active">Business Hours</li>
                        </ol>
                    </div>
                </div>
                <div class="card card-default color-palette-box">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="fas fa-tag"></i>
                            Schedule
                        </h3>
                        @if ($data->isEmpty())
                            <button class="float-right btn btn-primary"data-toggle="modal" data-target="#exampleModal"> <a
                                    class="text-white"href="{{ route('Availability') }}">Add schedule</a> </button>
                        @endif
                    </div>
                    <div class="card-body">

                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>S.No</th>
                                    <th>Day</th>
                                    <th>Starting Time</th>
                                    <th>Closing Time</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($data as $key => $value)
                                    <tr>
                                        <td>{{ $key + 1 }}</td>
                                        <td class="text-capitalize">{{ $value->day }}</td>
                                        <td>{{$value->start }}</td>
                                        <td>{{$value->end }}</td>
                                        <td>
                                            <p class="{{ $value->is_open == 0 ? 'btn btn-danger' : 'btn btn-success' }} status cursor-pointer"
                                                data-id="{{ $value->id }}">{{ $value->is_open == 0 ? 'close' : 'open' }}
                                            </p>
                                        </td>
                                        <td>
                                            <a href="{{ route('update.AvailabilityTime', ['id' => $value->id]) }}"
                                                class="btn btn-info"><i class="fa fa-edit"></i></a>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
        </section>
    </div>
@endsection
<input type="hidden" id="tokan" value="{{ csrf_token() }}">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    $(function() {
        $('.status').click(function() {
            //var status = $(this).prop('checked') == true ? 1 : 0;
            var id = $(this).data('id');
            var status = $(this);
            //console.log(button);
            $.ajax({
                type: "GET",
                dataType: "json",
                url: "{{ route('update.availability') }}",
                data: {
                    'id': id
                },
                success: function(data) {
                    if (data.responseCode == 200) {
                        if (data.status == 1) {
                            status.removeClass("btn btn-danger");
                            status.addClass("btn btn-success");
                            status.html('open')
                        } else if (data.status == 0) {
                            status.removeClass("btn btn-success");
                            status.addClass("btn btn-danger");
                            status.html('close')
                        } else {
                            console.log('internal error occured');
                        }
                    } else {
                        alert(data.message);
                    }
                }
            });
        })
    })
</script>
