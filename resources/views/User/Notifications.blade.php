

<!-- Content Wrapper. Contains page content -->
@extends('User.layout.layout')
@section('content')
<br>
  <div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6"> 
              <h1>Notifications</h1>
                </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="{{route('User.Dashboard')}}">Home</a></li>
                <li class="breadcrumb-item active">Notifications</li>
              </ol>
            </div>

          </div>
          <br>
          @if(session('err'))
          <div class="alert bg-danger" role="alert">
            {{session('err')}}
            <button type="button" class="close text-white" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
          </div>
          @endif
          @if(session('success'))
          <div class="alert bg-primary" role="alert">
            {{session('success')}}
            <button type="button" class="close text-white" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
          </div>
          @endif

                  @if(count($data))
                  
         @foreach($data as $value)

                <div class="card my-2">
            <div class="card-body">
             @if($value->image_path)

                   <img   src="{{$value->image_path}}" alt="" style="width:60px;" class="px-2 rounded-circle">

                @else
                <img   src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAKlBMVEXl6O2trrLq6/Cqq6/b3uPf4eXDxMnNztK0tbnX19vHyc2+wMS6u7/R0taDySJWAAADJ0lEQVR4nO3Yi46bMBCF4XiMbQzm/V+3M77BbldqterFkf6vUhOygHzi8YW8XgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHgT8q2LzJ9uyR+WUwr1TUrpenweUjq2+3A7Uvp4oUi4YlHHVW8geqfpe9/X33F434I4dX8syTt/3IenHj6/AA1U7Apf/7M7SNRThrBSQudqwmAtzbNhsutxnGeJBSnP6yyPK/E4YmnfjETn9iH8o9b/jqP1gCXc3TkTbv55KNm50/lHu60DL61UG4mv+sVYwpWCTSOhRjruMtXmnuWR8HS7njBHoh67fY61NtcsnzDrq3ZLa7XoqLyKK3Oe1IrVQi39ULL28OcbLZ/wcl7HXs9gEbQQ9zuRDtG7TPVEv32+0fIJkyacbRTrv0dCLcqaOrUP9F35abJcPqG+ig61viI4nyzWXaQ2JN2IrOdeXycUWW8PMBJq+2QOtctrY6NmbudcdR2xyG1t14l0+zJh3rp/1/5f6wlttpRRaG1AxjG11iJtS8ZRg+kwHJdvoXq1hJ0/V+rFkdBG3RhqoVbrMbqsF+ldppawZQhtC1O/AEvYtzSLJixjqElbGFOvX6lFarRurTrl7sOt5nMj4dIzTS3M1kppu5mr5anDLlallal+8FwsRhGvnlAr8dVXBC29/LI9gMu9OHv1uVam1sfpUYdvkzC2lyKpLRO5b3F0Yj37Q9HeFn3b0twJ36MPRTfe9qxkzdQijDVhm3asSPu8Yo9UdTa1x5B5h/dIaI8WdV+tU0fu4y/MOHM/+rrL9PEs+RYJZesJdcbZewkG227bTPp4pihzXnJ76HuX9+hDW83rhq2uai1RqMughZoNt7g2XK2otaz7Jq2sntC1hH1kaWeORJZQJ9YPu+zx2BR2e8bfz3gWd6+HU1xoyW+/0+gcMpY450ci53Wbo394rAxS/Pip49rtV5r2r/br6W8rbWq2nIONw9wnR303fkbK+pnknJ+nh5z7pltku454xuNqA9JuMS219QYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4D/4AaTBEm14d8yxAAAAAElFTkSuQmCC" alt="" style="width:60px;" class="px-2 rounded-circle">
                   
                 @endif  
                    {{$value->message}}
              <span class="float-right text font-weight-bold cursor-pointer" style="font-size:22px;"><a href="{{route('UserNotification.Delete',['id'=>$value->id])}}"><i class="fa fa-trash  float-right mb-2 text-danger "></i></a>
              </span><br>
            </div>
          </div>
         @endforeach
         @else
        <p class="item-center">No notifications to show </p>

         @endif
        
        </div><!-- /.container-fluid -->
      </section>
  </div>
  @endsection
