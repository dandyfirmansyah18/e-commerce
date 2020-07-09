@extends('layouts.frontLayout.front_design')
@section('content')
<?php use App\Product; ?>
<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Wislist</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
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
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td>Action</td>
						</tr>
					</thead>
					<tbody>
						<?php $total_amount = 0; ?>
						@foreach($userWishlist as $whislist)
							<tr>
								<td class="cart_product">
									<a href=""><img style="width:100px;" src="{{ asset('/images/backend_images/product/small/'.$whislist->image) }}" alt=""></a>
								</td>
								<td class="cart_description">
									<h4><a href="">{{ $whislist->product_name }}</a></h4>
									<p>Product Code: {{ $whislist->product_code }}</p>
								</td>
								<td class="cart_price">
									<p>IDR {{ number_format($whislist->price,0,',','.') }}</p>
								</td>
								<td class="cart_delete">
									<a class="cart_quantity_delete" href="{{ url('/product/'.$whislist->product_id) }}"><i class="fa fa-add"></i>Add to Cart</a>
								</td>
							</tr>
						@endforeach
						
					</tbody>
				</table>
			</div>
		</div>
</section> <!--/#cart_items-->

@endsection