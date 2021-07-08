<script src="<?php echo base_url() . 'assets/' ?>plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        $('#prodi').change(function() {
            var id_prodi = $('#prodi').val();
            if (id_prodi != '') {
                $.ajax({
                    url: '<?php echo site_url('administrator/fetch_kelas/') ?>' + id_prodi,
                    method: "POST",
                    success: function(data) {
                        $('#kelas').html(data);
                    }
                });
            } else {
                $('#prodi').html('<option value="">Pilih Prodi</option>');
                $('#kelas').html('<option value="">Pilih Kelas</option>');
            }
        });

    });

    $(function() {
        $('#table_matakuliah').DataTable({
            'lengthChange': false,
            "ordering": true;
            "serverSide": true,
            "responsive": true,
            "ajax": {
                "url": "<?php echo site_url('administrator/' . $page_function . '/pagination') ?>",
                "type": "POST"
            },
            "order": [
                [0, "desc"]
            ]
        })

    })
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
                            <select class="form-control select2" style="width: 100%;" name="prodi" id="prodi">
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
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Kelas</label>
                            <select class="form-control select2" style="width: 100%;" name="kelas" id="kelas">
                                <option selected="selected">-- Pilih Kelas --</option>
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
            <table id="table_matakuliah" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th> Jam </th>
                        <th> Senin </th>
                        <th> Selasa </th>
                        <th> Rabu </th>
                        <th> Kamis </th>
                        <th> Jum'at </th>
                        <th> Aksi </th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
</section>