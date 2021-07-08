<script src="<?php echo base_url() . 'assets/' ?>plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">
    var id_edit;

    $(document).ready(function() {

        $(function() {
            //Enable iCheck plugin for checkboxes
            //iCheck for checkbox and radio inputs
            $('.mailbox-messages input[type="checkbox"]').iCheck({
                checkboxClass: 'icheckbox_flat-blue',
                radioClass: 'iradio_flat-blue'
            });

            //Enable check and uncheck all functionality
            $(".checkbox-toggle").click(function() {
                var clicks = $(this).data('clicks');
                if (clicks) {
                    //Uncheck all checkboxes
                    $(".mailbox-messages input[type='checkbox']").iCheck("uncheck");
                    $(".fa", this).removeClass("fa-check-square-o").addClass('fa-square-o');
                } else {
                    //Check all checkboxes
                    $(".mailbox-messages input[type='checkbox']").iCheck("check");
                    $(".fa", this).removeClass("fa-square-o").addClass('fa-check-square-o');
                }
                $(this).data("clicks", !clicks);
            });
        });

    });

    function delete_function(id) {
        swal({
                title: "Hapus Data ?",
                type: "warning",
                showCancelButton: true,
                showLoaderOnConfirm: true,
                confirmButtonText: "Ya, Hapus",
                closeOnConfirm: false
            },
            function() {
                $.ajax({
                    method: 'POST',
                    url: '<?php echo base_url() . 'administrator/' . $page_function . '/delete/' ?>' + id,
                    dataType: 'json',
                    success: function(resp) {
                        updateAllTable();
                        return swal({
                            html: true,
                            timer: 1300,
                            showConfirmButton: false,
                            title: resp['msg'],
                            type: resp['status']
                        });
                        swal.close();
                    }
                });
            });
    }
</script>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-md-3">
            <a class="btn btn-app" href="<?php echo base_url() . 'administrator/tambahberita' ?>">
                <i class="fa fa-edit"></i> Tambah
            </a>
            <!-- <a href="compose.html" class="btn btn-primary btn-block margin-bottom">Compose</a> -->
        </div>
        <!-- /.col -->
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Inbox</h3>

                    <div class="box-tools pull-right">
                        <div class="has-feedback">
                            <input type="text" class="form-control input-sm" placeholder="Search Mail">
                            <span class="glyphicon glyphicon-search form-control-feedback"></span>
                        </div>
                    </div>
                    <!-- /.box-tools -->
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                    <div class="mailbox-controls">
                        <!-- Check all button -->
                        <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i>
                        </button>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
                        </div>

                        <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                        <div class="pull-right">
                            1-50/200
                            <div class="btn-group">
                                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive mailbox-messages">
                        <table class="table table-hover table-striped">
                            <tbody>
                                <?php foreach ($berita as $br) { ?>
                                    <tr>
                                        <td><input type="checkbox" class="delete_checkbox" value="<?php echo $br->id_berita ?>"></td>
                                        <td class="mailbox-star"><i class="fa fa-star text-yellow"></i></a></td>
                                        <td class="mailbox-name"><a href="read-mail.html"><?php echo $br->pengirim ?></a></td>
                                        <td class="mailbox-subject"><b><?php echo $br->headline ?></b>
                                        </td>
                                        <td><?php echo substr(nl2br($br->isi), 0, 71) ?></td>
                                        <td class="mailbox-attachment"></td>
                                        <td class="mailbox-date"><?php echo date('d-M-Y | H:i', strtotime($br->tanggal)) ?></td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>

                </div>
                <!-- /.box-body -->
            </div>
            <!-- /. box -->
        </div>
        <!-- /.col -->


    </div>
    <!-- /.row -->
</section>
<!-- /.content -->