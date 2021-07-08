<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Md_matakuliah extends CI_Model
{
    function getTop20Jadwal()
    {
        $this->db->limit(20);
        $this->db->join(
            'matakuliah mk',
            'mk.id_matakuliah = jd.matakuliah',
            'dosen do',
            'do.id_dosen' = 'jd.id_dosen',
            'kelas ks',
            'ks.id_kelas = jd.id_kelas',
            'ruangan rg',
            'rg.id_ruangan = jd.id_ruangan',
            'jam jm',
            'jm.id_jam = jd.id_jam'
        );
        $this->db->order_by('jd.id_jadwal', 'desc');
        $this->db->from('jadwal jd');
        return $this->db->get()->result();
    }

    function getJam()
    {
        $this->db->select('*');
        $this->db->from('jam');
        $this->db->order_by('id', 'desc');
        return $this->db->get();
    }

    function getAllJadwal()
    {

        return $this->datatables
            ->select('  
            jd.jam,
            pg.nama,
            lg.jenis_aksi,
            lg.keterangan
            lg.tgl
        ')
            ->from('log lg')
            ->join('pengguna pg', 'pg.pengguna_id = lg.pengguna_id', 'left')
            ->where('pg.status = 1 and lg.status=1')
            ->generate();
    }
}
