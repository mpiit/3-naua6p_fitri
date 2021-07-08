<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Administrator extends CI_Controller
{
    function __construct()
    {
        parent::__construct();

        $this->load->model('md_berita');
        $this->load->model('md_kuliah');
        $this->load->model('md_ganti');
        $this->load->model('md_pengguna');

        $this->load->helper('format');
        $this->load->helper('userlog');
        $this->load->helper('encrypt');
        $this->load->helper('datetime');
    }

    public function index()
    {
        $allow_access = array('Administrator', 'Akuntan', 'Eksekutif');
        if (in_array($this->session->userdata('login_type'), $allow_access)) {
            redirect(base_url() . 'administrator/berita');
        } else {
            redirect(base_url() . 'login');
        }
    }
    //#------------------------------------------------------------------------------------------------#//  

    public function berita($param1 = '', $param2 = '')
    {
        $login_type = $this->session->userdata('login_type');
        $page_data['login_type']       = $login_type;
        $page_data['page_name']        = 'berita2';
        $page_data['page_title']       = 'Kelola Berita';
        $page_data['page_breadcrumb']  = generate_breadcrumb(array('Kelola Berita'));
        $page_data['page_active']      = array('Kelola Berita');
        $page_data['berita'] = $this->md_berita->getTop20News();
        $page_data['page_function']   = __FUNCTION__;

        if ($param1 == 'add') {
            $data['headline'] = $this->input->post('headline');
            $data['pengirim'] = "baakpcr@gmail.com";
            $data['penerima'] = $this->input->post('penerima');
            $data['tanggal'] = date('Y-m-d H:i:s');
            $data['isi']     = $this->input->post('isi');
            $data['status']  = 1;

            $empty = 0;
            if ($empty) {
                $result = array('status' => 'error', 'msg' => 'Tambahkan penerima !');
            } else {
                $result = array('status' => 'success', 'msg' => 'Berita Terkirim');

                $config = [
                    'protocol' => 'smtp',
                    'smtp_host' => 'ssl://smtp.googlemail.com',
                    'smtp_user' => 'baakpcr@gmail.com',
                    'smtp_pass' => 'adminku123',
                    'smtp_port' => 465,
                    'mailtype' => 'html',
                    'charset' => 'utf-8',
                    'newline' => "\r\n",
                    'wordwrap' => TRUE
                ];

                $this->load->library('email', $config);

                $this->email->from($data['pengirim']);
                $this->email->to($data['penerima']);
                $this->email->subject($data['headline']);
                $this->email->message($data['isi']);

                $this->email->send();

                $this->md_berita->addBerita($data);
            }
            echo json_encode($result);
            die;
        } else if ($param1 == 'delete') {

            $id_berita    = decrypt($param2);
            $temp           = $this->md_berita->getBeritaById($id_berita);
            $data['status'] = 1;
            $this->md_berita->deleteBerita($id_berita);
            echo json_encode(array('status' => 'success', 'msg' => 'Berita berhasil dihapus'));
            die;
        } else if ($param1 == 'pagination') {
            $dt    = $this->md_berita->getAllBerita();
            $data  = array();
            foreach ($dt['data'] as $row) {
                $id       = encrypt($row->id_berita);
                $li_btn   = array();
                $ckbox = array();
                $link = array();
                $li_btn[] = '<div class="mailbox-controls">
                <button type="button" class="btn btn-default btn-sm" onclick="delete_function(' . $id . ')">
                <i class="fa fa-trash-o"></i></button>
                </div>';
                $ckbox[] = '<div class="mailbox-controls"><input type="checkbox"></div>';


                $th1 = ($ckbox);
                $th2 = $row->pengirim;
                $th3 = $row->headline;
                $th4 = nl2br($row->isi);
                $th5 = date('d-M-Y | H:i', strtotime($row->tanggal));
                $th6 = ($li_btn);
                $data[] = gathered_data(array($th1, $th2, $th3, $th4, $th5, $th6));
            }
            $dt['data'] = $data;
            echo json_encode($dt);
            die;
        }


        $this->load->view('index', $page_data);
    }

    // private function sendEmail()
    // {
    //     $config = [
    //         'protocol' => 'smtp',
    //         'smtp_host' => 'ssl://smtp.goolemail.com',
    //         'smtp_user' => 'freelancerran88@gmail.com',
    //         'smtp_pass' => 'adminku123',
    //         'smtp_port' => 465,
    //         'mailtype' => 'html',
    //         'charset' => 'utf-8',
    //         'newline' => "\r\n"
    //     ];

    //     $this->load->library('email', $config);

    //     $this->email->from('freelancerran88@gmail.com', 'Admin Baak PCR');
    //     $this->email->to('viraannisaa99@gmail.com');
    //     $this->email->subject('coba');
    //     $this->email->message('Hello world');

    //     if ($this->email->send()) {
    //         return true;
    //     } else {
    //         echo $this->email->print_debugger();
    //         die;
    //     }
    //     return $this->sendEmail();
    // }

    public function tambahberita($param1 = "")
    {
        $login_type = $this->session->userdata('login_type');
        $page_data['page_name']       = 'tambahberita';
        $page_data['page_title']      = 'Tambah Berita';
        $page_data['page_breadcrumb'] = generate_breadcrumb(array('Tambah Berita'));
        $page_data['login_type']      = $login_type;

        $this->load->view('index', $page_data);
    }

    public function kuliah($param1 = "")
    {
        $login_type = $this->session->userdata('login_type');
        $page_data['page_name']       = 'semester';
        $page_data['page_title']      = 'Pilih Semester';
        $page_data['page_breadcrumb'] = generate_breadcrumb(array('Tambah Berita'));
        $page_data['login_type']      = $login_type;

        $this->load->view('index', $page_data);
    }

    public function kuliah1($param1 = "", $param2 = "")
    {
        $login_type = $this->session->userdata('login_type');
        $page_data['page_name']       = 'kuliah';
        $page_data['page_title']      = 'Kelola Jadwal Kuliah';
        $page_data['page_breadcrumb'] = generate_breadcrumb(array('Kelola Jadwal Kuliah'));
        $page_data['login_type']      = $login_type;
        $page_data['prodi'] = $this->md_kuliah->fetch_prodi();

        $jam = $this->md_kuliah->getAllJamKuliah();
        $data_jam = array('0');;
        foreach ($jam as $row) {
            $data_jam[$row['id_jam']] = $row['mulai'];
        }
        $page_data['jam'] = $data_jam;

        $kls = $this->input->post('id_kelas');
        $progstudi = $this->input->post('id_prodi');
        $page_data['progstudi'] = $progstudi;

        if ($progstudi != '') {
            $kelas = $this->md_kuliah->getKelasByProgramStudi($progstudi);
            $dataps = array($progstudi => '--pilih PS--');
            $psd = $this->md_kuliah->cekKelasByPsId($progstudi, $kls);
            if ($psd == false) {
                //echo 'false';exit;
                $kls = 0;
            }
        } else {
            $kelas = $this->md_kuliah->getAllKelas();
            $dataps = array('0' => '--pilih PS--');
        }
        //kelas
        if ($kls != 0) {
            //print($kls);exit;
            $data_kls = array($kls => '--pilih kelas--');
            $dataps = array($progstudi => '--pilih PS--');
        } else {
            $data_kls = array('0' => '--pilih kelas--');
        }

        $page_data['kls'] = $kls;


        $ps = $this->md_kuliah->getAllProgramStudi();
        foreach ($ps as $row) {
            $dataps[$row->id_prodi] = $row->nama_prodi;
        }
        $page_data['ps'] = $dataps;

        foreach ($kelas as $row) {
            $data_kls[$row->id_kelas] = $row->nama_kelas;
        }
        $page_data['kelas'] = $data_kls;

        $page_data['page_function']   = __FUNCTION__;

        if ($param1 == 'delete') {

            $id_jadwal      = decrypt($param2);
            $temp           = $this->md_kuliah->getJadwalById($id_jadwal);
            $data['status'] = 1;
            $this->md_kuliah->deleteJadwal($id_jadwal);
            echo json_encode(array('status' => 'success', 'msg' => 'Jadwal berhasil dihapus'));
            die;
        }


        $this->load->view('index', $page_data);
    }

    function fetch_kelas($id_prodi)
    {
        $this->load->model('md_kuliah');
        if ($id_prodi) {
            echo $this->md_kuliah->fetch_kelas($id_prodi);
        }
    }

    function fetch_kelasni($id_kelas)
    {
        // if ($this->input->post('id_kelas')) {
        //     echo $this->md_kuliah->fetch_kelasku($this->input->post('id_kelas'));
        // }

        $page_data['prodi'] = $this->md_kuliah->fetch_prodi();

        $jam = $this->md_kuliah->getAllJamKuliah();
        $data_jam = array('0');;
        foreach ($jam as $row) {
            $data_jam[$row['id_jam']] = $row['mulai'];
        }
        $page_data['jam'] = $data_jam;

        $kls = $this->input->post('id_kelas');
        $progstudi = $this->input->post('id_prodi');
        $page_data['progstudi'] = $progstudi;

        if ($progstudi != '') {
            $kelas = $this->md_kuliah->getKelasByProgramStudi($progstudi);
            $dataps = array($progstudi => '--pilih PS--');
            $psd = $this->md_kuliah->cekKelasByPsId($progstudi, $kls);
            if ($psd == false) {
                //echo 'false';exit;
                $kls = 0;
            }
        } else {
            $kelas = $this->md_kuliah->getAllKelas();
            $dataps = array('0' => '--pilih PS--');
        }
        //kelas
        if ($kls != 0) {
            //print($kls);exit;
            $data_kls = array($kls => '--pilih kelas--');
            $dataps = array($progstudi => '--pilih PS--');
        } else {
            $data_kls = array('0' => '--pilih kelas--');
        }

        $page_data['kls'] = $kls;


        $ps = $this->md_kuliah->getAllProgramStudi();
        foreach ($ps as $row) {
            $dataps[$row->id_prodi] = $row->nama_prodi;
        }
        $page_data['ps'] = $dataps;

        foreach ($kelas as $row) {
            $data_kls[$row->id_kelas] = $row->nama_kelas;
        }
        $page_data['kelas'] = $data_kls;
        $page_data['id_kelas'] = $id_kelas;

        $page_data['page_function']   = __FUNCTION__;
        $this->load->view('page/table', $page_data);
    }

    public function ganti($param1 = "")
    {
        $login_type = $this->session->userdata('login_type');
        $page_data['page_name']       = 'ganti';
        $page_data['page_title']      = 'Kelola Jadwal Ganti';
        $page_data['page_breadcrumb'] = generate_breadcrumb(array('Kelola Jadwal Ganti'));
        $page_data['login_type']      = $login_type;
        $page_data['prodi'] = $this->md_ganti->fetch_prodi();
        $page_data['page_function']   = __FUNCTION__;

        if ($param1 == 'pagination') {
            $dts = $this->md_ganti->getById();
            foreach ($dts as $row) {
                $ids = $row['id_prodi'];

                $dt    = $this->md_ganti->getGanti($ids);
                $no    = 0;
                $start = $this->input->post('start');
                $data  = array();
                foreach ($dt['data'] as $row) {
                    ++$no;
                    $th1    = ++$start;
                    $th2    = $row->tanggal;
                    $th3    = $row->jam;
                    $th4    = $row->nama_kelas;
                    $th5    = $row->matakuliah;
                    $th6    = $row->nama_ruangan;
                    $data[] = gathered_data(array($th1, $th2, $th3, $th4, $th5, $th6));
                }
                $dt['data'] = $data;
                echo json_encode($dt);
                die;
            }
        }

        $this->load->view('index', $page_data);
    }

    public function kalender($param1 = "")
    {
        $login_type = $this->session->userdata('login_type');
        $page_data['page_name']       = 'kalender';
        $page_data['page_title']      = 'Kelola Kalender Akademik';
        $page_data['page_breadcrumb'] = generate_breadcrumb(array('Kelola Kalender Akademik'));
        $page_data['login_type']      = $login_type;

        $this->load->view('index', $page_data);
    }

    public function pengguna($param1 = '', $param2 = '')
    {
        $login_type = $this->session->userdata('login_type');
        $page_data['login_type']      = $login_type;
        $page_data['page_name']       = 'pengguna';
        $page_data['page_title']      = 'Pengguna';
        $page_data['page_function']   = __FUNCTION__;
        $page_data['page_breadcrumb'] = generate_breadcrumb(array('Pengguna'));

        if ($param1 == 'add') {
            $data['nama']     = $this->input->post('nama');
            $data['email']    = $this->input->post('email');
            $data['username'] = $this->input->post('username');
            $data['password'] = hash('sha512', $this->input->post('password'));
            $data['level']    = $this->input->post('level');
            $data['status']   = 1;

            $empty = check_empty_form($data, array('email'));
            if ($empty) {
                $result = array('status' => 'error', 'msg' => 'Form penting tidak boleh kosong !');
            } else {
                if ($this->input->post('password') != $this->input->post('confirm_password'))
                    $result = array('status' => 'error', 'msg' => 'Cek kembali confirm password !');
                else {
                    $result = array('status' => 'success', 'msg' => 'Pengguna berhasil ditambahkan');
                    $this->md_pengguna->addPengguna($data);
                    $this->md_log->addLog(userLog('Menambah Pengguna', 'Menambah pengguna "' . $data['nama'] . '" sebagai ' . $data['level']));
                }
            }

            echo json_encode($result);
            die;
        } else if ($param1 == 'edit') {
            $id = decrypt($param2);
            $dt = $this->md_pengguna->getPenggunaById($id);
            foreach ($dt as $row) {
                $row->pengguna_id = encrypt($row->pengguna_id);
            }
            echo json_encode($dt);
            die;
        } else if ($param1 == 'update') {
            $pengguna_id      = decrypt($param2);
            $data['nama']     = $this->input->post('nama');
            $data['email']    = $this->input->post('email');
            $data['username'] = $this->input->post('username');
            $data['level']    = $this->input->post('level');
            $this->md_pengguna->updatePengguna($pengguna_id, $data);
            $this->md_log->addLog(userLog('Memperbaharui Pengguna', 'Memperbaharui data pengguna ' . $data['nama']));
            echo json_encode(array('status' => 'success', 'msg' => 'Pengguna berhasil diperbaharui'));
            die;
        } else if ($param1 == 'delete') {
            $pengguna_id    = decrypt($param2);
            $temp           = $this->md_pengguna->getPenggunaById($pengguna_id);
            $data['status'] = 2;
            $this->md_pengguna->updatePengguna($pengguna_id, $data);
            $this->md_log->addLog(userLog('Menghapus Pengguna', 'Menghapus pengguna ' . $temp[0]->nama));
            echo json_encode(array('status' => 'success', 'msg' => 'Pengguna berhasil dihapus'));
            die;
        } else if ($param1 == 'reset') {

            if ($this->input->post('password') != $this->input->post('confirm_password')) {
                echo json_encode(array('status' => 'error', 'msg' => 'Confirm Password salah !'));
            } else {
                $pengguna_id      = decrypt($param2);
                $temp             = $this->md_pengguna->getPenggunaById($pengguna_id);
                $data['password'] = hash('sha512', $this->input->post('password'));
                $this->md_pengguna->updatePengguna($pengguna_id, $data);
                $this->md_log->addLog(userLog('Memperbaharui Pengguna', 'Reset password pengguna ' . $temp[0]->nama));
                echo json_encode(array('status' => 'success', 'msg' => 'Reset Password Berhasil !'));
            }
            die;
        } else if ($param1 == 'pagination') {
            $dt    = $this->md_pengguna->getAllPengguna();
            $start = $this->input->post('start');
            $data  = array();
            foreach ($dt['data'] as $row) {
                $id       = encrypt($row->pengguna_id);
                $li_btn   = array();
                $li_btn[] = '<a href="javascript:;" class="btnEdit_' . $id . '" onClick=\'edit_function("show",' . $id . ')\'>Edit</a>';

                if ($row->depedencis == 0)
                    $li_btn[] = '<a href="javascript:;" class="btnDelete_' . $id . '" onClick=\'delete_function(' . $id . ')\'>Delete</a>';

                $th1 = ++$start . '.';
                $th2 = $row->nama;
                $th3 = $row->email;
                $th4 = $row->username;
                $th5 = $row->level;
                $th6 = generateBtnAction($li_btn);
                $data[] = gathered_data(array($th1, $th2, $th3, $th4, $th5, $th6));
            }
            $dt['data'] = $data;
            echo json_encode($dt);
            die;
        }

        $this->load->view('index', $page_data);
    }

    public function log($param1 = "")
    {
        $login_type = $this->session->userdata('login_type');
        $page_data['page_name']       = 'log';
        $page_data['page_title']      = 'Log System';
        $page_data['page_breadcrumb'] = generate_breadcrumb(array('Log System'));
        $page_data['login_type']      = $login_type;

        if ($param1 == 'pagination') {
            $dt    = $this->md_log->getAllLog();
            $no    = 0;
            $start = $this->input->post('start');
            $data  = array();
            foreach ($dt['data'] as $row) {
                ++$no;
                $th1    = ++$start;
                $th2    = $row->nama;
                $th3    = $row->jenis_aksi;
                $th4    = $row->keterangan;
                $th5    = date('d-M-Y | H:i', strtotime($row->tgl));
                $data[] = gathered_data(array($th1, $th2, $th3, $th4, $th5));
            }
            $dt['data'] = $data;
            echo json_encode($dt);
            die;
        }

        $this->load->view('index', $page_data);
    }
}
