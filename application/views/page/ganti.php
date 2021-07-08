<script src="<?php echo base_url() . 'assets/' ?>plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function(event) {
        table = $('#table_gnt').DataTable({
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
    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Prodi</label>
                            <select class="form-control select2" style="width: 100%;">
                                <option selected="selected">-- Pilih Prodi --</option>
                                <?php
                                foreach ($prodi as $br) { ?>
                                    <option value="<?php echo $br->id_prodi ?>"><?php echo $br->nama_prodi ?></option>
                                    }
                                <?php } ?>
                            </select>
                        </div>
                        <!-- /.form-group -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table id="table_gnt" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th> No </th>
                        <th> Tanggal </th>
                        <th> Jam </th>
                        <th> Kelas </th>
                        <th> Mata Kuliah </th>
                        <th> Ruangan </th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
</section>