<script src="<?php echo base_url() . 'assets/' ?>plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">
    var id_edit;

    function reset_form() {
        $("#editModalForm")[0].reset();
        $('.form-line').removeClass('focused');
        $('#editModalForm select[name=level] option[value=""]').prop("selected", true).trigger('change');
    }

    function updateAllTable() {
        table.ajax.reload(null, false);
    }

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

    function add_function() {
        swal({
                title: "Apakah data sudah benar ?",
                type: "warning",
                showCancelButton: true,
                showLoaderOnConfirm: true,
                confirmButtonText: "Ya",
                closeOnConfirm: false
            },
            function() {
                $.ajax({
                    method: 'POST',
                    url: '<?php echo base_url() . 'administrator/' . $page_function . '/add' ?>',
                    data: $('#add-form').serialize(),
                    dataType: 'json',
                    success: function(resp) {
                        if (resp['status'] == 'success') {
                            updateAllTable();
                            $("#add-form")[0].reset();
                        }
                        return swal({
                            html: true,
                            timer: 1300,
                            showConfirmButton: false,
                            title: resp['msg'],
                            type: resp['status']
                        });
                    }
                });
            });
    }

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


    $(document).ready(function() {
        table = $('#table_berita').DataTable({
            "processing": true,
            "serverSide": true,
            "bInfo": false,
            "bLengthChange": false,
            "ordering": false,
            "responsive": true,
            "ajax": {
                "url": "<?php echo site_url('administrator/' . $page_function . '/pagination') ?>",
                "type": "POST"
            },
            "order": [
                [0, "desc"]
            ],

        });
    });
</script>




<section class="content">
    <div class="row">
        <div class="col-md-3">
            <a class="btn btn-app" data-toggle="modal" data-target="#modal-default">
                <i class="fa fa-edit"></i> Tambah
            </a>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="modal-default">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h3 class="modal-title">Pesan Baru</h3>
                        <?php echo form_open('administrator', array('id' => 'add-form', 'autocomplete' => "off")); ?>
                        <div class="modal-body">
                            <div class="form-group">
                                <!-- <b><b><strong class="col-red">*</strong> Penerima</b></p> -->
                                <input type="Email" name="penerima" class="form-control" size="30" placeholder="Email to:">
                            </div>
                            <div class="form-group">
                                <!-- <b><b><strong class="col-red">*</strong> Subjek</b></p> -->
                                <input type="text" name="headline" class="form-control" placeholder="Subject">
                            </div>
                            <div class="form-group">
                                <!-- <b><b>Isi</b></p> -->
                                <textarea rows="7" name="isi" class="form-control" placeholder="Message" style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
                            <button type="button" class="btn bg-green col-white waves-effect" onclick="add_function()"><span>SUBMIT</span></button>
                        </div>
                        <?php echo form_close(); ?>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Mail</h3>

                    <!-- /.box-tools -->
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">

                    <div class="mailbox-controls">
                        <div class="table-responsive mailbox-messages">
                            <table class="table table-hover table-striped" id="table_berita">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th class="mailbox-name"></th>
                                        <th class="mailbox-subject"></th>
                                        <th></th>
                                        <th class="mailbox-date"></th>
                                        <th></th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /. box -->
        </div>
    </div>
</section>