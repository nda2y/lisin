<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Elek_brg extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Elek_brg_model');
        $this->load->library('form_validation');
    }    
function data() {
        $table = 'elek_brg';
        $primaryKey = 'id_brg';
        $columns = array(
         array('db' => 'id_brg', 'dt' => 0),array('db' => 'id_brg', 'dt' => 0),
array('db' => 'id_user_brg', 'dt' => 1),
array('db' => 'nm_brg', 'dt' => 2),
array('db' => 'merk', 'dt' => 3),
array('db' => 'SN', 'dt' => 4),
array(
                'db' => 'id_brg',
                'dt' => 5,
                'formatter' => function( $d, $row ) {
            return anchor('groups/read/'.$d,'<i class="fa fa-eye"></i>',"class='btn btn-sm btn-danger'").' '.
                   anchor('groups/update/'.$d,'<i class="fa fa-edit"></i>',"class='btn btn-sm btn-danger'").' '.
                   anchor('groups/delete/'.$d,'<i class="fa fa-trash"></i>',"class='btn btn-sm btn-danger'");
                }
            )
        );

        $sql_details = array(
            'user' => $this->db->username,
            'pass' => $this->db->password,
            'db' => $this->db->database,
            'host' => $this->db->hostname
        );
        
        $this->load->library('ssp');
        echo json_encode(
                SSP::simple($_GET, $sql_details, $table, $primaryKey, $columns)
        );
    }

    public function index()
    {
        $elek_brg = $this->Elek_brg_model->get_all();

        $data = array(
            'elek_brg_data' => $elek_brg
        );

        $this->template->load('template','elek_brg/elek_brg_list', $data);
    }

    public function read($id) 
    {
        $row = $this->Elek_brg_model->get_by_id($id);
        if ($row) {
            $data = array(
		'id_brg' => $row->id_brg,
		'id_user_brg' => $row->id_user_brg,
		'nm_brg' => $row->nm_brg,
		'merk' => $row->merk,
		'SN' => $row->SN,
	    );
            $this->load->view('elek_brg/elek_brg_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('elek_brg'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('elek_brg/create_action'),
	    'id_brg' => set_value('id_brg'),
	    'id_user_brg' => set_value('id_user_brg'),
	    'nm_brg' => set_value('nm_brg'),
	    'merk' => set_value('merk'),
	    'SN' => set_value('SN'),
	);
        $this->template->load('template','elek_brg/elek_brg_form', $data);
    }
    
    public function create_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
		'id_user_brg' => $this->input->post('id_user_brg',TRUE),
		'nm_brg' => $this->input->post('nm_brg',TRUE),
		'merk' => $this->input->post('merk',TRUE),
		'SN' => $this->input->post('SN',TRUE),
	    );

            $this->Elek_brg_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('elek_brg'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->Elek_brg_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('elek_brg/update_action'),
		'id_brg' => set_value('id_brg', $row->id_brg),
		'id_user_brg' => set_value('id_user_brg', $row->id_user_brg),
		'nm_brg' => set_value('nm_brg', $row->nm_brg),
		'merk' => set_value('merk', $row->merk),
		'SN' => set_value('SN', $row->SN),
	    );
            $this->template->load('template','elek_brg/elek_brg_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('elek_brg'));
        }
    }
    
    public function update_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id_brg', TRUE));
        } else {
            $data = array(
		'id_user_brg' => $this->input->post('id_user_brg',TRUE),
		'nm_brg' => $this->input->post('nm_brg',TRUE),
		'merk' => $this->input->post('merk',TRUE),
		'SN' => $this->input->post('SN',TRUE),
	    );

            $this->Elek_brg_model->update($this->input->post('id_brg', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('elek_brg'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->Elek_brg_model->get_by_id($id);

        if ($row) {
            $this->Elek_brg_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('elek_brg'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('elek_brg'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('id_user_brg', 'id user brg', 'trim|required');
	$this->form_validation->set_rules('nm_brg', 'nm brg', 'trim|required');
	$this->form_validation->set_rules('merk', 'merk', 'trim|required');
	$this->form_validation->set_rules('SN', 'sn', 'trim|required');

	$this->form_validation->set_rules('id_brg', 'id_brg', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function excel()
    {
        $this->load->helper('exportexcel');
        $namaFile = "elek_brg.xls";
        $judul = "elek_brg";
        $tablehead = 0;
        $tablebody = 1;
        $nourut = 1;
        //penulisan header
        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0,pre-check=0");
        header("Content-Type: application/force-download");
        header("Content-Type: application/octet-stream");
        header("Content-Type: application/download");
        header("Content-Disposition: attachment;filename=" . $namaFile . "");
        header("Content-Transfer-Encoding: binary ");

        xlsBOF();

        $kolomhead = 0;
        xlsWriteLabel($tablehead, $kolomhead++, "No");
	xlsWriteLabel($tablehead, $kolomhead++, "Id User Brg");
	xlsWriteLabel($tablehead, $kolomhead++, "Nm Brg");
	xlsWriteLabel($tablehead, $kolomhead++, "Merk");
	xlsWriteLabel($tablehead, $kolomhead++, "SN");

	foreach ($this->Elek_brg_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
	    xlsWriteNumber($tablebody, $kolombody++, $data->id_user_brg);
	    xlsWriteLabel($tablebody, $kolombody++, $data->nm_brg);
	    xlsWriteLabel($tablebody, $kolombody++, $data->merk);
	    xlsWriteNumber($tablebody, $kolombody++, $data->SN);

	    $tablebody++;
            $nourut++;
        }

        xlsEOF();
        exit();
    }

    public function word()
    {
        header("Content-type: application/vnd.ms-word");
        header("Content-Disposition: attachment;Filename=elek_brg.doc");

        $data = array(
            'elek_brg_data' => $this->Elek_brg_model->get_all(),
            'start' => 0
        );
        
        $this->load->view('elek_brg/elek_brg_doc',$data);
    }

}

/* End of file Elek_brg.php */
/* Location: ./application/controllers/Elek_brg.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2020-03-30 14:42:42 */
/* http://harviacode.com */