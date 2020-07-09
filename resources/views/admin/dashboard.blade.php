@extends('layouts.adminLayout.admin_design')
@section('content')
<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
<!--End-breadcrumbs-->

<!--Action boxes-->
  <div class="container-fluid">
<!--End-Action boxes-->    

<!--Chart-box-->    
    <div class="row-fluid">
      <div class="widget-box">
        <div class="widget-title bg_lg"><span class="icon"><i class="icon-signal"></i></span>
          <h5>Site Analytics</h5>
        </div>
        <div class="widget-content" >
          <div class="row-fluid">
            <div class="span9">
              <div class="chart"></div>
            </div>
            <div class="span3">
              <ul class="site-stats">
                <li class="bg_lo"><i class="icon-user"></i> <strong>2540</strong> <small>Total User</small></li>
                <li class="bg_lb"><i class="icon-plus"></i> <strong>120</strong> <small>Total Product</small></li>
                <li class="bg_ls"><i class="icon-tag"></i> <strong>9540</strong> <small>Total Orders</small></li>
                <li class="bg_lg"><i class="icon-tag"></i> <strong>9540</strong> <small>New Orders</small></li>
                <li class="bg_ly"><i class="icon-tag"></i> <strong>9540</strong> <small>Paid Orders</small></li>
                <li class="bg_lr"><i class="icon-repeat"></i> <strong>10</strong> <small>Cancelled Orders</small></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
<!--End-Chart-box--> 
    <hr/>
  </div>
</div>

<!--end-main-container-part-->

@endsection