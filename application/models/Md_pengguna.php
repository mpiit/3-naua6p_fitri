<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Md_pengguna extends CI_Model
{

    function getPenggunaByLevel($level)
    {
        $this->db->from('pengguna');
        $this->db->where_in('level', $level);
        $this->db->where('status', 1);
        $this->db->order_by('pengguna_id', 'desc');
        $hasil = $this->db->get()->result();
        return $hasil;
    }
    function countPenggunaByLevel($level = "")
    {
        $this->db->select('count(*) as total');
        $this->db->from('pengguna');
        $this->db->where('status', 1);

        if ($level)
            $this->db->where_in('level', $level);

        $hasil = $this->db->get()->result();
        return $hasil;
    }
    function getPenggunaByEmail($email)
    {
        return $this->db->get_where('pengguna pg', array('pg.email' => $email, 'pg.status' => 1))->result();
    }

    function getPenggunaByUsernameByPass($username, $pass)
    {
        return $this->db->get_where('pengguna', array('username' => $username, 'password' => $pass, 'status' => 1))->result();
    }


    function getPenggunaById($id)
    {
        return $this->db->get_where('pengguna pg', array('pg.pengguna_id' => $id))->result();
    }

    function updatePengguna($id, $data)
    {
        $this->db->where('pengguna_id', $id);
        $this->db->update('pengguna', $data);
        return $this->db->affected_rows() > 0 ? TRUE : FALSE;
    }

    function addPengguna($data)
    {
        $this->db->insert('pengguna', $data);
        return $this->db->affected_rows() > 0 ? $this->db->insert_id() : FALSE;
    }

    function getAllPengguna()
    {
        return $this->datatables
            ->select('  
            pg.pengguna_id,
            pg.nama,
            pg.email,
            pg.username,
            pg.level,
            pg.status,
            (select count(*) from log where pengguna_id = pg.pengguna_id) as depedencis
        ')
            ->from('pengguna pg')
            ->where('pg.status = 1')
            ->generate();
    }
}
