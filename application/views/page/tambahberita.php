<script src="<?php echo base_url() . 'assets/' ?>plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">
    function updateAllTable() {
        table_berita.ajax.reload(null, false);
    }

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
</script>

<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Compose New Message</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <?php echo form_open('administrator', array('id' => 'add-form', 'autocomplete' => "off")); ?>
                    <div class="form-group">
                        <input class="form-control" name="pengirim" placeholder="To:">
                    </div>
                    <div class="form-group">
                        <input class="form-control" name="headline" placeholder="Subject:" required>
                    </div>
                    <div class="form-group">
                        <textarea id="compose-textarea" name="isi" class="form-control" style="height: 200px"></textarea>
                    </div>
                    <div class="form-group">
                        <div class="btn btn-default btn-file">
                            <i class="fa fa-paperclip"></i> Attachment
                            <input type="file" name="attachment">
                        </div>
                        <p class="help-block">Max. 32MB</p>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="pull-right">
                        <button type="submit" class="btn btn-primary" onclick="add_function()"><i class="fa fa-envelope-o"></i> Send</button>
                    </div>
                    <a href="<?php echo base_url() . 'administrator/berita' ?>"><button type="reset" class="btn btn-default"><i class="fa fa-times"></i> Discard</button></a>
                </div>
                <!-- /.box-footer -->
            </div>
            <!-- /. box -->
        </div>
        <!-- /.col -->
        <?php echo form_close(); ?>
    </div>
</section>