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
	// Participants
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

	//$json_array[] = array( "participants" => $participant_array );

	//
	// Video links
	//
	$videolink_array = array();
	$videolink_list = pg_query($dbconn, "
			SELECT vl.link, vl.name
			FROM videolinks vl
			WHERE vl.excursion_id=" . $excursionId );
	
	while ($row = pg_fetch_assoc($videolink_list)) {
	
		$videolink_array[] = array(
				"link" => $row['link'],
				"name" => $row['name'],
		);
	}
	
	if (!$videolink_list) {
		echo pg_last_error();
		exit;
	}	
	
	//$json_array[] = array( "videolinks" => $videolink_array );
	
	//
	// Music links
	//
	$musiclink_array = array();
	$musiclink_list = pg_query($dbconn, "
			SELECT ml.link, ml.name
			FROM musiclinks ml
			WHERE ml.excursion_id=" . $excursionId );
	
	while ($row = pg_fetch_assoc($musiclink_list)) {
	
		$musiclink_array[] = array(
				"link" => $row['link'],
				"name" => $row['name'],
		);
	}
	
	if (!$musiclink_list) {
		echo pg_last_error();
		exit;
	}
	
	//$json_array[] = array( "musiclinks" => $musiclink_array );
	
	//
	// Picture links
	//
	$picturelink_array = array();
	$picturelink_list = pg_query($dbconn, "
			SELECT pic.title, pic.href, m.nickname
			FROM pictures pic, participants par, members m
			WHERE pic.participant_id=par.id AND par.member_id=m.id AND par.excursion_id=" . $excursionId .
			" ORDER BY m.nickname");
	
	while ($row = pg_fetch_assoc($picturelink_list)) {
	
		$picturelink_array[] = array(
				"title" => $row['title'],
				"href" => $row['href'],
				"nickname" => $row['nickname'],
		);
	}
	
	if (!$picturelink_list) {
		echo pg_last_error();
		exit;
	}
	
	//$json_array[] = array( "musiclinks" => $musiclink_array );
	
	
	//
	// json osszeallitasa
	//
	$json_array = array( 
		"participants" => $participant_array,
		"videolinks" => $videolink_array,
		"musiclinks" => $musiclink_array,
		"picturelinks" => $picturelink_array,
	);
	
	//echo "<pre>";
	//var_dump($json_array);
	//echo "</pre>";
	
	echo json_encode( $json_array );	

?>
