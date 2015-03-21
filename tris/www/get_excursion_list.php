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

	// Create DB connection
	$conn_string = "host=".$dbhost . " port=". $dbport . " dbname=" . $dbname . " user=" . $dbuser . " password=" . $dbpwd;
	$dbconn = pg_connect($conn_string);
	if(!$dbconn){
		echo "Can not connect to database";
		exit;
	}
	//pg_setclientencoding( 'utf-8', $dbconn );
	
	//XML preparation
	/*$xmlResult = new DOMDocument('1.0', 'UTF-8');*/

	//json preparation
	$excursion_array = array();
	

//	$xmlExcursions = $xmlResult->appendChild($xmlResult->createElement("excursions"));

	$excursion_list = pg_query($dbconn, "SELECT id, name, date_start, days, color FROM excursions ORDER BY date_start;");
	if (!$excursion_list) {
		echo pg_last_error();
		exit;
	}

	//Through the excursion list
	while ($row = pg_fetch_assoc($excursion_list)) {

		$start_time =  strtotime( $row['date_start']);
		$next_time =  strtotime( '+' . ($row['days']-1) . ' day', $start_time );
		$date = date( "Y.m.d", $next_time);
		
 		//<excursion>
		/*$xmlExcursion = $xmlExcursions->appendChild( $xmlResult->createElement("excursion") );
		$xmlExcursion->setAttribute( "id", $row['id']);
		$xmlExcursion->setAttribute( "name", $row['name']);
		$xmlExcursion->setAttribute( "dateStart", $row['date_start']);
		$xmlExcursion->setAttribute( "dateEnd", $date);
		$xmlExcursion->setAttribute( "days", $row['days']);
		$xmlExcursion->setAttribute( "color", $row['color']);*/
		
		$excursion_array[] = array(
			"id" => $row['id'],
			"name" => $row['name'],
			"dateStart" => $row['date_start'],
			"dateEnd"=> $date,
			"days"=> $row['days'],
			"color" => $row['color']				
		);				
	}
	
	$json_array = array( "excursions" => $excursion_array );
	
	//echo $xmlResult->saveXML();
	//echo "<pre>";
	//var_dump($json_array);
	//echo "</pre>";
	
	echo json_encode( $json_array );	

?>
