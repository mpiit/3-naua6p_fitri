<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Md_kuliah extends CI_Model
{
    function fetch_prodi()
    {
        $this->db->order_by('nama_prodi', 'asc');
        $query = $this->db->get('prodi');
        return $query->result();
    }

    function fetch_kelas($id_prodi)
    {
        $this->db->where('id_prodi', $id_prodi);
        $this->db->order_by('nama_kelas', 'ASC');
        $query = $this->db->get('kelas');
        $output = '<option selected="selected">-- Pilih Kelas --</option>';
        foreach ($query->result() as $row) {
            $output .= '<option value="' . $row->id_kelas . '">' . $row->nama_kelas . '</option>';
        }
        return $output;
    }

    function fetch_kelasku($id_kelas)
    {
        $this->db->where('id_kelas', $id_kelas);
        $this->db->order_by('nama_kelas', 'ASC');
        $query = $this->db->get('kelas');
        $output = '';
        foreach ($query->result() as $row) {
            $output .= $row->id_kelas;
        }
        return $output;
    }

    function getJam()
    {
        $this->db->select('id_kelas');
        $this->db->from('kelas');
        $query = $this->db->get()->result_array();
        return $query;
    }

    public function getAllProgramStudi()
    {
        $query = $this->db->from('prodi ps')
            ->join('dosen dsn', 'ps.id_prodi = dsn.id_prodi', 'inner')
            ->get();
        return $query->result();
    }

    public function getKelasByProgramStudi($ps)
    {
        $query = $this->db->select('id_kelas,nama_kelas')
            ->where('id_prodi', $ps)
            ->get('kelas');

        return $query->result();
    }
    public function getAllKelas()
    {
        return $this->db->get('kelas')->result();
    }

    public function getAllJamKuliah()
    {
        return $this->db->get('jam')->result_array();
    }

    function getJadwalByJadwalId($where)
    {
        $query = $this->db->select('*')
            ->where('id_jadwal', $where)
            ->get('jadwal1');
        return $query->result();
    }

    function getJadwalById($id)
    {
        return $this->db->get_where('jadwal1 jd', array('jd.id_jadwal' => $id))->result();
    }


    function deleteJadwal($id)
    {
        $this->db->where('id_jadwal', $id);
        $this->db->delete('jadwal1');
    }


    function getAllJadwal($hari, $kls = '', $jam)
    {
        $this->db->select('
            jd.id_jadwal,
            jd.id_jam as id_jk,
            jd.hari, 
            r.nama_ruangan,
            ks.nama_kelas,
            mk.matakuliah,
            dsn.nama_dosen,
            jm.jam,
            jm.mulai as jam_mulai,
            jm.keterangan as jam_jk,
            mk.jam as jam_mk,
        ');
        $this->db->from('matakuliah mk');
        $this->db->join('jadwal1 jd', 'mk.id_matakuliah = jd.id_matakuliah', 'left');
        $this->db->join('dosen dsn', 'jd.id_dosen = dsn.id_dosen', 'left');
        $this->db->join('jam jm', 'jd.id_jam = jm.id_jam');
        $this->db->join('kelas ks', 'jd.id_kelas = ks.id_kelas');
        $this->db->join('ruangan r', 'jd.id_ruangan = r.id_ruangan');
        $this->db->where('jd.hari', $hari);
        if (!empty($kls)) {
            $this->db->where('ks.id_kelas', $kls);
        }
        $this->db->where('jd.id_jam', $jam);

        return $this->db->get()->result();
    }

    // function getAllJadwal($hari, $kelas, $jam)
    // {
    //     return $this->datatables
    //         ->select(' 
    //         jd.id_jadwal,
    //         jd.hari,
    //         ks.nama_kelas,
    //         mk.jam as mk,
    //         mk.matakuliah,
    //         ds.nama_dosen,
    //         rg.nama_ruangan,
    //         jm.jam,
    //         jm.mulai,


    //     ')
    //         ->from('jadwal1 jd')
    //         ->join('kelas ks', 'ks.id_kelas = jd.id_kelas', 'left')
    //         ->join('matakuliah mk', 'mk.id_matakuliah = jd.id_matakuliah', 'left')
    //         ->join('dosen ds', 'ds.id_dosen = jd.id_dosen', 'left')
    //         ->join('ruangan rg', 'rg.id_ruangan = jd.id_ruangan', 'left')
    //         ->join('jam jm', 'jm.id_jam = jd.id_jam', 'left')
    //         ->where('jd.hari', $hari)
    //         ->where('ks.id_kelas', $kelas)
    //         ->where('jd.id_jam', $jam)
    //         ->generate();
    // }

    // function getAllJadwal($hari, $kelas, $jam)
    // {
    //      return $this->datatables
    //         ->select(' 
    //         jd.id_jadwal,
    // jd.hari,
    // ks.nama_kelas,
    // mk.jam,
    // mk.matakuliah,
    // ds.nama_dosen,
    // rg.nama_ruangan,
    // jm.jam,
    // jm.mulai,

    //     ')
    // ->from('jadwal1 jd')
    // ->join('kelas ks', 'ks.id_kelas = jd.id_kelas', 'left')
    // ->join('matakuliah mk', 'mk.id_matakuliah = jd.id_matakuliah', 'left')
    // // ->join('jadwal jd', 'mk.id_matakuliah = jd.id_matakuliah', 'left')
    // ->join('dosen ds', 'jd.id_dosen = ds.id_dosen', 'left')
    // ->join('ruangan rg', 'rg.id_ruangan = jd.id_ruangan', 'left')
    // ->join('jam jm', 'jm.id_jam = jd.id_jam', 'left')
    // ->where('jd.hari', $hari)
    // ->where('ks.id_kelas', $kelas)
    // ->where('jd.id_jam', $jam)
    // ->order_by('jd.id_jam', 'asc')
    //         ->generate();
    // }
}
