<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title><?php echo $page_title ?> | Sistem Informasi Penjadwalan</title>
    <!-- Tell the browser to be responsive to screen width -->


    <?php include "include_css.php" ?>
</head>

<!-- Login -->
<?php
if ($page_name != 'login') {
    ?>


    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <header class="main-header">
                <!-- Logo -->
                <a href="index2.html" class="logo">
                    <!-- logo for regular state and mobile devices -->
                    <b class="logo-mini"><b>S</b>IP</b>
                    <span class="logo-lg"><b>Si</b>Pen</span>
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>
                    <?php include "include_navbar.php"; ?>
            </header>

            <?php include "include_sidebar.php"; ?>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1 style="margin-top:0px"><b><?php echo $page_title ?></b></h1>
                    <ol class="breadcrumb">
                        <?php
                        foreach ($page_breadcrumb as $pb) {
                            $active = $pb == $page_title ? 'class="active"' : '';
                            echo '<li ' . $active . '>' . $pb . '</li>';
                        }
                        ?>
                    </ol>
                    <?php include 'page/' . $page_name . '.php'; ?>
                </section>
                <?php include "include_js.php" ?>
            </div>
        </div>
    </body>
<?php } else {
    include 'page/' . $page_name . '.php';
    include "include_js.php";
} ?>