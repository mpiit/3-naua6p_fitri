<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Login extends CI_Controller
{

	public function __construct()
	{

		parent::__construct();
		$this->load->model('md_pengguna');
		$this->load->model('md_log');
		$this->load->helper('userLog');
		$this->load->helper('encrypt');
	}
	public function index()
	{
		$page_data['page_name']  = 'login';
		$page_data['page_title'] = 'BSTI Based Web';
		$this->load->view('index', $page_data);
	}

	public function oauth()
	{
		$uname    = $this->input->post('username');
		$password = hash('sha512', $this->input->post('password'));
		$cek      = $this->md_pengguna->getPenggunaByUsernameByPass($uname, $password);
		if ($cek) {
			$this->session->set_userdata('pengguna_id', $cek[0]->pengguna_id);
			$this->session->set_userdata('nama', $cek[0]->nama);
			$this->session->set_userdata('login_type', $cek[0]->level);
			$this->md_log->addLog(userLog('Login', $cek[0]->nama . ' Login ke System'));

			redirect(base_url() . 'administrator');
		} else {
			$this->session->set_flashdata('error', '<br>Username atau Password tidak terdaftar');
			redirect(base_url() . 'login');
		}
	}

	public function logout($param = '')
	{
		if ($this->session->userdata('pengguna_id')) {
			$this->md_log->addLog(userLog('Logout', $this->session->userdata('nama') . ' Logout dari System'));
		}
		$this->session->sess_destroy();
		redirect(base_url() . 'login');
	}
}
