<!DOCTYPE html>
<html>

<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?php echo base_url() . 'assets/' ?>dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p><?php echo $this->session->userdata('nama') ?>
                </p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- search form -->
        <!-- <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                    <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                    </button>
                </span>
            </div>
        </form> -->
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">MAIN NAVIGATION</li>
            <li class="<?php echo  $page_name == 'berita' ? 'active' : '' ?>">
                <a href="<?php echo base_url() ?>">
                    <i class="fa fa-dashboard"></i> <span>Kelola Berita</span>
                    <span class="pull-right-container">
                        <!-- <i class="fa fa-angle-left pull-right"></i> -->
                    </span>
                </a>
            </li>
            <li class="<?php echo  $page_name == 'kuliah' ? 'active' : '' ?>">
                <a href="<?php echo base_url() . 'administrator/kuliah' ?>">
                    <i class="fa fa-th"></i> <span>Kelola Jadwal Kuliah</span>
                    <span class="pull-right-container">
                        <small class="label pull-right bg-green">new</small>
                    </span>
                </a>
            </li>
            <li class="<?php echo  $page_name == 'ganti' ? 'active' : '' ?>">
                <a href="<?php echo base_url() . 'administrator/ganti' ?>">
                    <i class="fa fa-pie-chart"></i>
                    <span>Kelola Jadwal Ganti</span>
                    <span class="pull-right-container">
                        <!-- <i class="fa fa-angle-left pull-right"></i> -->
                    </span>
                </a>
            </li>
            <li class="<?php echo  $page_name == 'kalender' ? 'active' : '' ?>">
                <a href="<?php echo base_url() . 'administrator/kalender' ?>">
                    <i class="fa fa-calendar"></i> <span>Calendar</span>
                    <span class="pull-right-container">
                        <small class="label pull-right bg-red">3</small>
                        <small class="label pull-right bg-blue">17</small>
                    </span>
                </a>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>