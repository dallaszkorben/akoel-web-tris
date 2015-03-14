<?php

	ini_set('display_errors', 1); //Needs to be here to see error message on the page, otherwise it ignors the error


//function exception_error_handler($errno, $errstr, $errfile, $errline ) {
//    throw new ErrorException($errstr, $errno, 0, $errfile, $errline);
//}
//set_error_handler("exception_error_handler");


	$ini = parse_ini_file( "tris.ini", true );

	$dbhost = $ini["database"]["dbhost"];
	$dbport = $ini["database"]["dbport"];
	$dbname = $ini["database"]["dbname"];
	$dbuser = $ini["database"]["dbuser"];
	$dbpwd = $ini["database"]["dbpwd"];

	//XML preparation
	$xmlResult = new DOMDocument('1.0', 'UTF-8');

	$xmlExcursions = $xmlResult->appendChild($xmlResult->createElement("excursions"));

	// Create DB connection
	$conn_string = "host=".$dbhost . " port=". $dbport . " dbname=" . $dbname . " user=" . $dbuser . " password=" . $dbpwd;
	$dbconn = pg_connect($conn_string);
	if(!$dbconn){
		echo "Can not connect to database";
		exit;	    
	}

/*	try{
	    $dbconn = pg_connect($conn_string);
	}Catch (Exception $e){
	    echo $e->getMessage();
	    exit;
	}
*/
	$excursion_list = pg_query($dbconn, "SELECT id, name, date_start, date_end FROM excursions;");
	if (!$excursion_list) {
		echo pg_last_error();
		exit;
	}

	//Through the excursion list
	while ($row = pg_fetch_assoc($excursion_list)) {

 		//<excursion>
		$xmlExcursion = $xmlExcursions->appendChild( $xmlResult->createElement("excursion") );
		$xmlExcursion->setAttribute( "id", $row['id']);
		$xmlExcursion->setAttribute( "name", $row['name']);
		$xmlExcursion->setAttribute( "dateStart", $row['date_start']);
		$xmlExcursion->setAttribute( "dateEnd", $row['date_end']);

		//
		//<tours>
		//
		$xmlTours = $xmlExcursion->appendChild( $xmlResult->createElement("tours") );
		
		$tour_list = pg_query($dbconn, "SELECT t.id as id, array_to_json(t.route) as route, t.timestamp as time, tt.name as type FROM excursions e, tours t, tour_type tt WHERE e.id=" . $row['id'] ." AND e.id=t.excursion_id AND t.tour_type_id=tt.id");
		if (!$tour_list) {
			echo pg_last_error();
			exit;
		}

		//Through the tour list
		while ($tour_row = pg_fetch_assoc($tour_list)) {
		
			//<tour>
			$xmlTour = $xmlTours->appendChild( $xmlResult->createElement("tour") );
			$xmlTour->setAttribute( "id", $tour_row['id'] );
			$xmlTour->setAttribute( "type", $tour_row['type'] );

				
			
			$array = json_decode($tour_row['route']);
			foreach( $array as $coord ){
				
				//<route>
				$xmlRoute = $xmlTour->appendChild( $xmlResult->createElement("route") );
				$xmlRoute->setAttribute( "lat", $coord['0'] );
				$xmlRoute->setAttribute( "lng", $coord['1'] );
				
				
			}
			
//$json = '{"1":1,"2":2,"3":3}';
//echo var_dump(json_decode($json));			
//echo var_dump($array);

		
		}

		//
		//<accomodations>
		//
		$xmlAccomodations = $xmlExcursion->appendChild( $xmlResult->createElement("accomodation") );

	}
	
	echo $xmlResult->saveXML();

?>
