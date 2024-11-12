@extends('admin.layout.layout')
@section('content')




<div class="content-wrapper">


    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>
            
              
            </h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Professional Details</li>
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
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
      
        <div class="card card-primary card-outline">
          <div class="card-header">
            <h3 class="card-title">
			<?php echo $info->name.' '."($info->professional_id)"; ?>
              
            </h3>
          </div>
          <div class="card-body">
            <h4></h4>
            <div class="row">
              <div class="col-5 col-sm-3" style="background:#f2f2f2;">
                <div class="nav flex-column nav-tabs h-100" id="vert-tabs-tab" role="tablist" aria-orientation="vertical">
					<a class="nav-link side-link active" id="vert-tabs-home-tab" data-toggle="pill" href="#vert-tabs-home" role="tab" aria-controls="vert-tabs-home" aria-selected="true">Profile</a>
					
					
					<a class="nav-link side-link" id="vert-tabs-health-tab" data-toggle="pill" href="#vert-tabs-health" role="tab" aria-controls="vert-tabs-health" aria-selected="false">Images</a>
					<a class="nav-link side-link" id="vert-tabs-records-tab" data-toggle="pill" href="#vert-tabs-records" role="tab" aria-controls="vert-tabs-records" aria-selected="false">Skills</a>
					
				</div>
              </div>
              <div class="col-7 col-sm-9">
                <div class="tab-content" id="vert-tabs-tabContent">
                  
				  <div class="tab-pane text-left fade show active" id="vert-tabs-home" role="tabpanel" aria-labelledby="vert-tabs-home-tab">

<section class="content">
      <div class="container-fluid">
        <!-- SELECT2 EXAMPLE -->
        <div class="card card-default " >
          <div class="card-header headertop">
            <h3 class="card-title">Profile</h3>
			
				<div class="card-tools">
				<a href="javascript:void()" data-toggle="modal" data-target="#profile" ><i class="fa fa-edit"></i></a>
				</div>
			
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <div class="row">
			
              <div class="col-md-4">
                <div class="form-group">
                  <p><label>Name </label></p>
                  <p><?php echo $info->name; ?></p>
                </div>
              </div>
			 
			  <div class="col-md-4">
                <div class="form-group">
                  <p><label>Email</label></p>
                  <p><?php echo $info->email; ?></p>
                </div>
              </div>
			  
			  <div class="col-md-4">
                <div class="form-group">
                  <p><label>Mobile</label></p>
                  <p><?php echo $info->mobile; ?></p>
                </div>
              </div>
			  
			  
			 <div class="col-md-4">
                <div class="form-group">
                  <p><label>password</label></p>
                  <p><?php echo $info->password; ?></p>
                </div>
              </div>
			  
			  <div class="col-md-4">
                <div class="form-group">
                  <p><label>address</label></p>
                  <p><?php echo $info->address; ?></p>
                </div>
              </div>
			  
			  <div class="col-md-4">
                <div class="form-group">
                  <p><label>Date of Register</label></p>
                  <p><?php echo $info->created_at; ?></p>
                </div>
              </div>
			  
			  <div class="col-md-4">
                <div class="form-group">
                  <p><label>Status</label></p>
                  <p><?php $status = $info->status;
					if($status=='1'){echo 'Active';}else{echo 'Deactive';}
				  ?></p>
                </div>
              </div>
			  
			  
			 
            </div>
           
          </div>
          <!-- /.card-body -->
         
		 
		  
		  
		  
		 <!-- <div class="card-header headertop">
            <h3 class="card-title">Address</h3>
				<div class="card-tools">
					<a href="javascript:void()" data-toggle="modal" data-target="#diagnostics-address" ><i class="fa fa-edit"></i></a>
				</div>
          </div>
		  
		  <div class="card-body">
            <div class="row">
             
			  <div class="col-md-4">
                <div class="form-group">
                  <p><label>Building Name & Number</label></p>
                  <p>Rishab tower, F-16</p>
                </div>
              </div>
			  
			   <div class="col-md-4">
                <div class="form-group">
                  <p><label>Location / Area</label></p>
                  <p>Adarsh Park, Gomti Nagar</p>
                </div>
              </div>
			  
			   <div class="col-md-4">
                <div class="form-group">
                  <p><label>City</label></p>
                  <p>Lucknow</p>
                </div>
              </div>
			  
			  <div class="col-md-4">
                <div class="form-group">
                  <p><label>State</label></p>
                  <p>Uttar Pradesh</p>
                </div>
              </div>
			  
			  <div class="col-md-4">
                <div class="form-group">
                  <p><label>Pincode</label></p>
                  <p>226556</p>
                </div>
              </div>
			  
            </div>
          </div>
		  
		  
		  
		  <div class="card-header headertop">
            <h3 class="card-title">About us</h3>
			
			<div class="card-tools">
					  <a href="javascript:void()" data-toggle="modal" data-target="#about" ><i class="fa fa-edit"></i></a>
					</div>
          </div>
		  
		  <div class="card-body">
            <div class="row">
			  <div class="col-md-12">
                <div class="form-group">
                  <p style="text-align:justify;">As you notice in the figure above, while the general trend for growth in the market looks healthy, the two main regions contributing to market growth by 2015 are the United States and the RoW (Rest of the World). The RoW market will expand by an estimated 8% from 2011 to 2015 and hence will be the major focus area for most medical diagnostics companies. In order to aid this growth, quite a few of the companies have setup global research, development and manufacturing centres within the emerging market economies and India and China host most of these centres</p>
                </div>
              </div>
            </div>
          </div>-->
		 
		 
		  
        </div>
       
        <!-- /.row -->
      </div>
	  
    </section>
	
	
		  </div>
		  
	  
			  
			 
		  
			
			
			 
			  
			  <div class="tab-pane fade" id="vert-tabs-health" role="tabpanel" aria-labelledby="vert-tabs-health-tab">
			   
			   
	  <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
		  
            <div class="card">
			
			<div class="card-header">
              <div class="card-tools" style="margin-right:2px;">
             <a href="javascript:void()" data-toggle="modal" data-target="#modal-add-image" > <button type="button" class="btn  bg-gradient-primary btn-position">Add Image</button></a>
              </div>
		    </div>
             
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Image</th>
                    <th>Status</th>
                    <th>Action</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                  
                  @foreach($Moreimages as $key => $orderDetails)
					<tr>
						

				<td><img src="{{$orderDetails->image}}" style="height:100px;width:100px;"></td>
                        
						<?php if($orderDetails->status=='0'){ ?>
						<td id="status_pending<?php echo $orderDetails->id; ?>">
							<span  class="badge badge-warning">pending</span>
						</td>
						<?php }else{ ?>
						<td  id="status_approved<?php echo $orderDetails->id; ?>">
							<span   class="badge badge-info">approved</span>
						</td>
						<?php } ?>
						<td>
							<select  class="form-control" id="status_update<?php echo $orderDetails->id; ?>">
							<option value="0" <?php if($orderDetails->status=='0'){echo 'selected';} ?>>Pending</option>
							<option value="1" <?php if($orderDetails->status=='1'){echo 'selected';} ?> > Approved</option>
							</select>
						</td>   
						
						<td>
						   
							<a class="btn btn-danger btn-sm" href="{{url('delete-more-images/'.$orderDetails->id)}}">
							<i class="fas fa-trash">
							</i>
							</a>
						</td>	
						
					</tr>
								  <input type="hidden" class="form-control" name="id" id="col_id<?php echo $orderDetails->id; ?>" value="<?php echo $orderDetails->id; ?>">

					<script>
			$(document).ready(function(){
			$('#status_update<?php echo $orderDetails->id; ?>').change(function(){
			var proffstatus = $('#status_update<?php echo $orderDetails->id; ?>').val();
			
			var col_id = <?php echo $orderDetails->id; ?>;
			
			$.ajax({
			url:'{{url("update-proffessional-status")}}',
			method:'POST',
			data:{proffstatus:proffstatus,col_id:col_id,'_token':"{{csrf_token()}}"},
			success:function(data){
			if(proffstatus==0){
				$('#status_approved<?php echo $orderDetails->id; ?>').html(data);
				$('#status_pending<?php echo $orderDetails->id; ?>').html(data);
			}else{
				$('#status_approved<?php echo $orderDetails->id; ?>').html(data);
				$('#status_pending<?php echo $orderDetails->id; ?>').html(data);
			}
			
			}
			});
			});
			});
			</script>
					
					@endforeach	
					
					
					
                  </tbody>
                  <tfoot>
                   
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
			
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
			  </div>
			  
			  <div class="tab-pane fade" id="vert-tabs-records" role="tabpanel" aria-labelledby="vert-tabs-records-tab">
			   
			   
			   
	 <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
		   <div class="card">
		   
		   <div class="card-header">
              <div class="card-tools" style="margin-right:2px;">
             <a href="javascript:void()" data-toggle="modal" data-target="#add-skill" > <button type="button" class="btn  bg-gradient-primary btn-position">Add Skill</button></a>
              </div>
		    </div>
             
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example9" class="table table-bordered table-striped">
                  <thead>
                  <tr>
					<th>S.no</th>
					<th>Skill</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
				  
					@foreach($skill as $key => $orderDetails)

					<tr>
					<td>{{$key + 1}}</td>
					<td>{{$orderDetails->skill}}</td>
					<td>

						<a class="btn btn-danger btn-sm" href="{{url('delete-skill/'.$orderDetails->id.'/'.$info->id)}}">
						<i class="fas fa-trash">
						</i>
						</a>
					
					</td>
					</tr>												
					@endforeach			
                  
                  </tbody>
                  <tfoot>
                   
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
			
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
			   
			   
			  </div>
			  
			  
			  
			 
			
			
			</div>
		  </div>
		</div>
			
			
          </div>
          <!-- /.card -->
        </div>
        <!-- /.card -->
		
		
        <!-- /.card -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>

 <div class="modal fade" id="profile">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Update Profile</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
             
			 
			 
        <!-- SELECT2 EXAMPLE -->
          <form action="{{url('proff-update')}}" method="post">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                    <label for="exampleInputEmail1">Name</label>
                    <input type="text" class="form-control" name="name" id="exampleInputEmail1" value="<?php echo $info->name; ?>">
                  </div>
			  </div>
			  @csrf
			  
			   <div class="col-md-6">
                <div class="form-group">
                    <label for="exampleInputEmail1">Email</label>
                    <input type="email" class="form-control" name="email" id="exampleInputEmail1" value="<?php echo $info->email; ?>">
                  </div>
			  </div>
			  
			   <div class="col-md-6">
                <div class="form-group">
                    <label for="exampleInputEmail1">Mobile</label>
                    <input type="text" class="form-control" name="mobile" id="exampleInputEmail1" value="<?php echo $info->mobile; ?>">
                  </div>
			  </div>
			  
			   <div class="col-md-6">
                <div class="form-group">
                    <label for="exampleInputEmail1">Password</label>
                    <input type="text" class="form-control" name="password" id="exampleInputEmail1" value="<?php echo $info->password; ?>">
                  </div>
			  </div>
			  
			   <div class="col-md-6">
                <div class="form-group">
                    <label for="exampleInputEmail1">Address</label>
                    <input type="text" class="form-control" name="address" id="exampleInputEmail1" value="<?php echo $info->address; ?>">
                    <input type="hidden" class="form-control" name="proff_id" id="exampleInputEmail1" value="<?php echo $info->id; ?>">
                  </div>
			  </div>
			  
              </div>
             
			 
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Update</button>
            </div>
			
			</form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
	  
	  
	  
	  <div class="modal fade" id="add-skill">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Add Skill</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
             
			 
			 
        <!-- SELECT2 EXAMPLE -->
          <form action="{{url('add-skill')}}" method="post">
            <div class="row">
              <div class="col-md-6">
               <div class="form-group">
                  <label>Skill</label>
					<select class="select2" name="skill[]" multiple="multiple" data-placeholder="Select Skill" style="width: 100%;">
					<option value="Php">Php</option>
					<option value="Html">Html</option>
					<option value="Java">Java</option>
					<option value="Codeignitor">Codeignitor</option>
					<option value="Laravel">Laravel</option>
					
					</select>
                </div>
			  </div>
			  @csrf
			  <input type="hidden" class="form-control" name="proff_id" id="exampleInputEmail1" value="<?php echo $info->id; ?>">

              </div>
             
			 
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Add</button>
            </div>
			
			</form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
	  
	  
	  <div class="modal fade" id="modal-add-image">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Add Image</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
             
			 
			 
        <!-- SELECT2 EXAMPLE -->
          <form action="{{url('add-more-images')}}" method="post" enctype="multipart/form-data">
            <div class="row">
              <div class="form-group">
                    <label for="exampleInputFile">More Images</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" name="filenames[]" multiple class="custom-file-input" id="exampleInputFile">
                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                      </div>
                     
                    </div>
                  </div>
			  @csrf
			  <input type="hidden" class="form-control" name="proff_id" id="exampleInputEmail1" value="<?php echo $info->id; ?>">

              </div>
             
			 
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Add</button>
            </div>
			
			</form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
	  
	  


	
	  
	  
					<script>
					$(document).ready(function(){
					$("#document").change(function(){
					var DocumentVal = $('#document').val();
					if(DocumentVal=='Rejected'){
						$('#modal-reject-document').modal('show');
					}
					});
					});
					</script>
					
					<script>
					$(document).ready(function(){
					$("#Others").click(function(){
					$("#rejection-text").css('display', 'block');
					});

					});
					
					
					</script>
	
	

  @endsection