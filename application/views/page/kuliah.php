<script src="<?php echo base_url() . 'assets/' ?>plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">
    function updateAllTable() {
        table.ajax.reload(null, false);
    }
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

        $('#kelas').change(function() {
            var id_kelas = $('#kelas').val();
            if (id_kelas != '') {
                $.ajax({
                    url: '<?php echo site_url('administrator/fetch_kelasni/') ?>' + id_kelas,
                    method: "POST",
                    data: {
                        id_kelas: id_kelas
                    },
                    success: function(data) {
                        // alert(data);
                        $('#testing').html(data);

                    }
                });
            } else {
                $('#prodi').html('<option value="">Pilih Prodi</option>');
                $('#kelas').html('<option value="">Pilih Kelas</option>');
            }
        });

    });

    // function delete_function(id) {
    //     swal({
    //             title: "Anda Yakin Menghapus Jadwal ?",
    //             type: "warning",
    //             showCancelButton: true,
    //             showLoaderOnConfirm: true,
    //             confirmButtonText: "Ya, Hapus",
    //             closeOnConfirm: false
    //         },
    //         function() {
    //             $.ajax({
    //                 method: 'POST',
    //                 url: '<?php echo base_url() . 'administrator/' . $page_function . '/delete/' ?>' + id,
    //                 dataType: 'json',
    //                 success: function(resp) {
    //                     return swal({
    //                         html: true,
    //                         timer: 1300,
    //                         showConfirmButton: false,
    //                         title: resp['msg'],
    //                         type: resp['status']
    //                     });
    //                     swal.close();
    //                 }
    //             });
    //         });
    // }

    $(function() {
        $('#table_matakuliah').DataTable({
            'lengthChange': false,
            "serverSide": true,
            "responsive": true,
            "ajax": {
                "url": "<?php echo site_url('administrator/' . $page_function . '/pagination') ?>",
                "type": "POST"
            },
            "order": [
                [0, "asc"]
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
                    <?php echo form_open('administrator/fetch_kelasni/'); ?>
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


        <div class="box-body" id="testing">
            Pilih kelas untuk menampilkan jadwal!
        </div>
    </div>
</section>