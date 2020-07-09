@extends('layouts.frontLayout.front_design')
@section('content')

<section id="cart_items">
	<div class="container">
		<div class="breadcrumbs">
			<ol class="breadcrumb">
			  <li><a href="#">Home</a></li>
              <li><a href="{{ url('orders') }}">Orders</a></li>
			  <li class="active">{{ $orderDetails->id }}</li>
			</ol>
		</div>
	</div>
</section>

<section id="do_action">
	<div class="container">
        @if(Session::has('flash_message_success'))
            <div class="alert alert-success alert-block">
                <button type="button" class="close" data-dismiss="alert">×</button> 
                    <strong>{!! session('flash_message_success') !!}</strong>
            </div>
        @endif
        @if(Session::has('flash_message_error'))
            <div class="alert alert-error alert-block" style="background-color:#f4d2d2">
                <button type="button" class="close" data-dismiss="alert">×</button> 
                    <strong>{!! session('flash_message_error') !!}</strong>
            </div>
        @endif  

        @if($orderDetails->transfer_attach)
            <a href="{{ asset('/images/backend_images/order/large/'.$orderDetails->transfer_attach) }}" target="_blank"><button class="btn btn-warning">Show Bukti Transfer</button></a><br><br>
        @else
            <button class="btn btn-success" onclick="modalbukti('{{ $orderDetails->id }}')">Upload Bukti Transfer</button><br><br>
        @endif
		<div class="heading" align="center">
			<table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>
                        <th>Product Code</th>
                        <th>Product Name</th>
                        <th>Product Size</th>
                        <th>Product Color</th>
                        <th>Product Price</th>
                        <th>Product Qty</th>
                    </tr>
                </thead>
                <tbody>
                	@foreach($orderDetails->orders as $pro)
                    <tr>
                        <td>{{ $pro->product_code }}</td>
                        <td>{{ $pro->product_name }}</td>
                        <td>{{ $pro->product_size }}</td>
                        <td>{{ $pro->product_color }}</td>
                        <td>{{ $pro->product_price }}</td>
                        <td>{{ $pro->product_qty }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
		</div>
	</div>
</section>
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Upload Bukti Transfer</h4>
            </div>
            <form enctype="multipart/form-data" name="formbuktitransfer" id="formbuktitransfer" action="{{ url('upload-bukti') }}" method="post">{{ csrf_field() }}
                <div class="modal-body">
                    <input type="hidden" name="orderid" value="{{ $orderDetails->id }}">
                    <input type="file" class="form-control" name="filebukti" required="">
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Upload</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    function modalbukti(){
        $('#myModal').modal('show');
    }
</script>


@endsection