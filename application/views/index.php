<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title> <?php echo $page_title ?> | Dashboard</title>
	<?php include "include_css.php" ?>
</head>

<?php
if ($page_name != 'login') {
	?>

	<body class="hold-transition skin-blue sidebar-mini">
		<div class="wrapper">

			<header class="main-header">
				<!-- Logo -->
				<a href="<?php echo base_url() ?>" class="logo">
					<!-- mini logo for sidebar mini 50x50 pixels -->
					<span class="logo-mini"><b>S</b>IP</span>
					<!-- logo for regular state and mobile devices -->
					<span class="logo-lg"><b>SI</b>Pen</span>
				</a>
				<!-- Header Navbar: style can be found in header.less -->
				<nav class="navbar navbar-static-top">
					<!-- Sidebar toggle button-->
					<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
						<span class="sr-only">Toggle navigation</span>
					</a>
					<?php include "include_navbar.php"; ?>
				</nav>
			</header>
			<!-- Left side column. contains the logo and sidebar -->

			<?php include "include_sidebar.php"; ?>

			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<section class="content-header">
					<h1>
						<?php echo $page_title ?>
						<small>Control panel</small>
					</h1>
					<ol class="breadcrumb">
						<?php
						foreach ($page_breadcrumb as $pb) {
							$active = $pb == $page_title ? 'class="active"' : '';
							echo '<li ' . $active . '>' . $pb . '</li>';
						}
						?>
					</ol>
				</section>


				<?php include 'page/' . $page_name . '.php'; ?>

			</div>
			<!-- /.content-wrapper -->
			<footer class="main-footer">
				<strong>&copy; <?php echo date('Y') ?> <a href="javascript:void(0);">SIP</a>.</strong>
			</footer>

			<!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
			<div class="control-sidebar-bg"></div>
		</div>
		<!-- ./wrapper -->

		<?php include "include_js.php" ?>
	</body>
<?php } else {
	include 'page/' . $page_name . '.php';
	include "include_js.php";
} ?>