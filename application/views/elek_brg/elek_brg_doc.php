<!doctype html>
<html>
    <head>
        <title>harviacode.com - codeigniter crud generator</title>
        <link rel="stylesheet" href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css') ?>"/>
        <style>
            .word-table {
                border:1px solid black !important; 
                border-collapse: collapse !important;
                width: 100%;
            }
            .word-table tr th, .word-table tr td{
                border:1px solid black !important; 
                padding: 5px 10px;
            }
        </style>
    </head>
    <body>
        <h2>Elek_brg List</h2>
        <table class="word-table" style="margin-bottom: 10px">
            <tr>
                <th>No</th>
		<th>Id User Brg</th>
		<th>Nm Brg</th>
		<th>Merk</th>
		<th>SN</th>
		
            </tr><?php
            foreach ($elek_brg_data as $elek_brg)
            {
                ?>
                <tr>
		      <td><?php echo ++$start ?></td>
		      <td><?php echo $elek_brg->id_user_brg ?></td>
		      <td><?php echo $elek_brg->nm_brg ?></td>
		      <td><?php echo $elek_brg->merk ?></td>
		      <td><?php echo $elek_brg->SN ?></td>	
                </tr>
                <?php
            }
            ?>
        </table>
    </body>
</html>