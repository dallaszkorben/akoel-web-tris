<?php

	include 'common.php';

	error_reporting(E_ALL);
	ini_set('display_errors', 1); //Needs to be here to see error message on the page, otherwise it ignors the error

	$ini = parse_ini_file( "tris.ini", true );

	$dbhost = $ini["database"]["dbhost"];
	$dbport = $ini["database"]["dbport"];
	$dbname = $ini["database"]["dbname"];
	$dbuser = $ini["database"]["dbuser"];
	$dbpwd = $ini["database"]["dbpwd"];

	$excursionId = $_GET[ 'excursionid' ];
	
	// Create DB connection
	$conn_string = "host=".$dbhost . " port=". $dbport . " dbname=" . $dbname . " user=" . $dbuser . " password=" . $dbpwd;
	$dbconn = pg_connect($conn_string);
	if(!$dbconn){
		echo "Can not connect to database";
		exit;
	}
	//pg_setclientencoding( 'utf-8', $dbconn );

	//json preparation
	$participant_array = array();

	//
	// Resztvevok
	//
	$participant_list = pg_query($dbconn, "
			SELECT m.nickname
			FROM participants p, members m
			WHERE p.excursion_id=" . $excursionId . " AND p.member_id=m.id");
		
	while ($row = pg_fetch_assoc($participant_list)) {
	
		$participant_array[] = array(
			"nickname" => $row['nickname'],
		);
	}
	
	if (!$participant_list) {
		echo pg_last_error();
		exit;
	}

	$json_array = array( "participants" => $participant_array );
	
	// echo $xmlResult->saveXML();
	// echo "<pre>";
	// var_dump($json_array);
	// echo "</pre>";
	
	echo json_encode( $json_array );	

?>
