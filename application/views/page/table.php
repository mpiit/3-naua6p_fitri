<script type="text/javascript">
    function delete_function(id) {
        swal({
                title: "Anda Yakin Menghapus Jadwal ?",
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


<table class="table table-bordered table-striped">
    <thead>

        <?php
        $row_senin = 0;
        $row_selasa = 0;
        $row_rabu = 0;
        $row_kamis = 0;
        $row_jumat = 0;

        // print_r($dkelas);
        $bar = '';



        // $kelasmu = '<div id="kelasku"></div>';
        // print_r($kelasmu);

        $alljamkuliah = all_jam();


        for ($i = 0; $i < count($alljamkuliah) + 1; $i++)
            //foreach ($alljamkuliah as $jam)
            {
                echo '<tr>';
                $hari = all_hari();
                // $jam = $alljamkuliah;
                for ($j = 0; $j < count($hari); $j++) {

                    if ($i == 0) {
                        if ($hari[$j] != '0') {

                            echo '<th class="text-center">' . strtoupper($hari[$j]) . '</th>';
                        } else {
                            echo '<th>JAM</th>';
                        }
                    } else {
                        if ($hari[$j] != '0') {

                            $items = array('#f56954', '#00c0ef', '#f39c12', '#d2d6de', '#605ca8', '#D81B60', '#39CCCC');

                            $kls = $id_kelas;
                            $jadwalfix = $this->md_kuliah->getAllJadwal($hari[$j], $kls, $i);


                            if ($jadwalfix != false) {
                                // $bg_td = 'style="background-color:' . $items[array_rand($items, 1)] . '"';
                                foreach ($jadwalfix as $jad) {
                                    if ($hari[$j] == 'Senin') {
                                        $row_senin = $jad->jam_mk + $jad->id_jk - 1;
                                        $bg_td = 'style="background-color:' . $items[array_rand($items, 1)] . '"';
                                        $bar = ' <div class="progress progress-xs"><div class="progress-bar progress-bar-warning bg-maroon" style="width: 100%"></div></div>';
                                    } elseif ($hari[$j] == 'Selasa') {
                                        $row_selasa = $jad->jam_mk + $jad->id_jk - 1;
                                        $bg_td = 'style="background-color:' . $items[array_rand($items, 1)] . '"';
                                        $bar = ' <div class="progress progress-xs"><div class="progress-bar progress-bar-warning" style="width: 100%"></div></div>';
                                    } elseif ($hari[$j] == 'Rabu') {
                                        $row_rabu = $jad->jam_mk + $jad->id_jk - 1;
                                        $bg_td = 'style="background-color:' . $items[array_rand($items, 1)] . '"';
                                        $bar = ' <div class="progress progress-xs"><div class="progress-bar progress-bar-success" style="width: 100%"></div></div>';
                                    } elseif ($hari[$j] == 'Kamis') {
                                        $row_kamis = $jad->jam_mk + $jad->id_jk - 1;
                                        $bg_td = 'style="background-color:' . $items[array_rand($items, 1)] . '"';
                                        $bar = ' <div class="progress progress-xs"><div class="progress-bar progress-bar-info" style="width: 100%"></div></div>';
                                    } elseif ($hari[$j] == 'Jumat') {
                                        $row_jumat = $jad->jam_mk + $jad->id_jk - 1;

                                        $bar = ' <div class="progress progress-xs"><div class="progress-bar progress-bar-purple" style="width: 100%"></div></div>';
                                    }

                                    // Menampilkan Jadwal
                                    echo '<td ' . $bg_td . ' class="text-center" rowspan="' . $jad->jam_mk . '" >' . $bar . ' <p>' . $jad->nama_kelas . '<br>' . $jad->matakuliah . '<br>' . $jad->nama_ruangan . '<br>' .
                                        $jad->jam_mulai . ' - ' . (($jad->jam_jk + $jad->jam_mk) - 1) . ':45:00</p></th>';
                                    ?>

                                <span class="text-center">
                                    <a class="btn btn-success btn-xs m-b-12" data-toggle="modal" data-target="#modal-default"><i class='glyphicon glyphicon-pencil'></i></a>
                                    <button type="button" class="btn btn-success btn-xs m-b-12"><i class='glyphicon glyphicon-pencil'></i></button>
                                    <button type="button" class="btn btn-danger btn-xs m-b-12" onclick="delete_function('<?= $jad->id_jadwal ?>')"><i class='glyphicon glyphicon-remove'></i></button>
                                </span>
                                <div class="modal fade" id="modal-default">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span></button>
                                                <h3 class="modal-title">Update Jadwal</h3>
                                            </div>
                                            <form>
                                                <?php echo form_open('administrator', array('id' => 'add-form', 'autocomplete' => "off")); ?>
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" name="kelas" placeholder="Kelas">
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

                            <?php

                        }
                        //Jika Jadwal Kosong
                    } else {
                        if ($i <= $row_senin && $hari[$j] == 'Senin') { } elseif ($i <= $row_selasa && $hari[$j] == 'Selasa') { } elseif ($i <= $row_rabu && $hari[$j] == 'Rabu') { } elseif ($i <= $row_kamis && $hari[$j] == 'Kamis') { } elseif ($i <= $row_jumat && $hari[$j] == 'Jumat') { } else {
                            echo '<td class="text-center">';

                            if ($kls != null and $kls != 0) {
                                echo 'Mulai<br>' . $jam[$i] . '<br>';
                                ?>
                                    <button type="button" onclick="editJadwal('','<?= $hari[$j] ?>','ADD','<?= $this->input->post('dkelas') ?>','<?= $i ?>','<?= $jam[$i] ?>')" class="btn btn-primary btn-xs m-b-12"><i class='glyphicon glyphicon-plus'></i></button>

                                <?php
                            } else {
                                echo '--';
                            }
                            echo '</td>';
                        }
                    }
                } else {
                    //Menampilkan Jam
                    echo '<td class="text-center">' . getKet($i) . '</td>';
                }
            }
        }
        echo '</tr>';
    }
?>
    </thead>
</table>