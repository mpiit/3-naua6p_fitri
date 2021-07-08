<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Md_log extends CI_Model {

    function getTop20Activity(){
        $this->db->limit(20);
        $this->db->join('pengguna pg','pg.pengguna_id = lg.pengguna_id');
        $this->db->order_by('lg.log_id','desc');
        $this->db->where('lg.status',1);
        $this->db->from('log lg');
        return $this->db->get()->result();
    }

    function addLog($data){
         $this->db->insert('log', $data);
         if ($this->db->affected_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
    
    function addLog_transact($data){
        $this->db->insert('log', $data);
    }

    function getAllLog(){

        return $this->datatables
        ->select('  
            lg.log_id,
            pg.nama,
            lg.jenis_aksi,
            lg.keterangan,
            lg.tgl
        ')
        ->from('log lg')
        ->join('pengguna pg','pg.pengguna_id = lg.pengguna_id','left')
        ->where('pg.status = 1 and lg.status=1')
        ->generate();        
    }
}