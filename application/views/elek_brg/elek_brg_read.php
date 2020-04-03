<!doctype html>
<html>
    <head>
        <title>harviacode.com - codeigniter crud generator</title>
        <link rel="stylesheet" href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css') ?>"/>
        <style>
            body{
                padding: 15px;
            }
        </style>
    </head>
    <body>
        <h2 style="margin-top:0px">Elek_brg Read</h2>
        <table class="table">
	    <tr><td>Id User Brg</td><td><?php echo $id_user_brg; ?></td></tr>
	    <tr><td>Nm Brg</td><td><?php echo $nm_brg; ?></td></tr>
	    <tr><td>Merk</td><td><?php echo $merk; ?></td></tr>
	    <tr><td>SN</td><td><?php echo $SN; ?></td></tr>
	    <tr><td></td><td><a href="<?php echo site_url('elek_brg') ?>" class="btn btn-default">Cancel</a></td></tr>
	</table>
        </body>
</html>