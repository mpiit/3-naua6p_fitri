<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Md_ganti extends CI_Model
{
    function fetch_prodi()
    {
        $this->db->join('prodi pd', 'pd.id_prodi = gt.id_prodi');
        $this->db->order_by('pd.nama_prodi', 'asc');
        $this->db->from('ganti gt');
        return $this->db->get()->result();
    }

    function getGanti($id_prodi)
    {

        return $this->datatables
            ->select('  
            gt.id_ganti,
            gt.tanggal,
            gt.jam,
            ks.nama_kelas,
            mk.matakuliah,
            rg.nama_ruangan,
            
        ')
            ->from('ganti gt')
            ->join('kelas ks', 'ks.id_kelas = gt.id_kelas', 'left')
            ->join('matakuliah mk', 'mk.id_matakuliah = gt.id_matakuliah', 'left')
            ->join('ruangan rg', 'rg.id_ruangan = gt.id_ruangan', 'left')
            ->where('gt.id_prodi', $id_prodi)
            ->generate();
    }

    function getById() {
        $this->db->select('id_prodi');
        $this->db->from('prodi');
        $query = $this->db->get()->result_array();
        return $query;
     }
}
