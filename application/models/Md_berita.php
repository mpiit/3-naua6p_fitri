<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Md_berita extends CI_Model
{
    function getTop20News()
    {
        $this->db->limit(20);
        $this->db->order_by('tanggal', 'asc');
        $this->db->from('berita');
        return $this->db->get()->result();
    }

    function addBerita($data)
    {
        $this->db->insert('berita', $data);
        return $this->db->affected_rows() > 0 ? $this->db->insert_id() : FALSE;
    }

    function getBeritaById($id)
    {
        return $this->db->get_where('berita br', array('br.id_berita' => $id))->result();
    }

    function fetchBerita()
    {
        $this->db->select('*');
        $this->db->from('berita');
        $this->db->order_by('id', 'desc');
        return $this->db->get();
    }

    function deleteBerita($id)
    {
        $this->db->where('id_berita', $id);
        $this->db->delete('berita');
    }

    function updateBerita($id, $data)
    {
        $this->db->where('id_berita', $id);
        $this->db->update('berita', $data);
        return $this->db->affected_rows() > 0 ? TRUE : FALSE;
    }


    function getAllBerita()
    {
        return $this->datatables
            ->select('  
            br.id_berita,
            br.headline,
            br.pengirim,
            br.penerima,
            br.tanggal,
            br.isi,
            (select count(*) from berita where id_berita = br.id_berita) as depedencis
        ')
            ->from('berita br')
            ->where('br.status = 1')
            ->generate();
    }
}
