<script src="<?php echo base_url() . 'assets/' ?>plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">
    var id_edit;

    function updateAllTable() {
        table_berita.ajax.reload(null, false);
    }



    function send() {
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

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-md-3">
            <a class="btn btn-app" data-toggle="modal" data-target="#modal-default">
                <i class="fa fa-edit"></i> Tambah
            </a>
        </div>

        <div class="modal fade" id="modal-default">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h3 class="modal-title">Pesan Baru</h3>
                    </div>
                    <form>
                        <?php echo form_open('administrator', array('id' => 'add-form', 'autocomplete' => "off")); ?>
                        <div class="modal-body">
                            <div class="form-group">
                                <input type="email" class="form-control" name="penerima" placeholder="Email to:">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="headline" placeholder="Subject">
                            </div>
                            <div>
                                <textarea class="textarea" name="isi" placeholder="Message" style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                            </div>
                        </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                        <button type="submit" name="send" class="btn btn-primary" onclick="send()">Send</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        <!-- /.col -->
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
        <!-- /.col -->


    </div>
    <!-- /.row -->
</section>
<!-- /.content -->