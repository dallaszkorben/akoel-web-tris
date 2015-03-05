<?php

	$ini = parse_ini_file( "excursions.ini", true );

	$dbhost = $ini["database"]["dbhost"];
	$dbport = $ini["database"]["dbport"];
	$dbname = $ini["database"]["dbname"];
	$dbuser = $ini["database"]["dbuser"];
	$dbpwd = $ini["database"]["dbpwd"];

	//XML preparation
	$xmlResult = new DOMDocument('1.0', 'UTF-8');

	//Create Root
	$xmlElement = $xmlResult->createElement("accomodations");
	//Append Root
	$xmlRoot = $xmlResult->appendChild($xmlElement);


	// Create DB connection
	$conn_string = "host=".$dbhost . " port=". $dbport . " dbname=" . $dbname . " user=" . $dbuser . " password=" . $dbpwd;
	$dbconn = pg_connect($conn_string);
	if (!$dbconn) {

		echo $result->saveXML();
		exit;
	}

	$result = pg_query($dbconn, "SELECT id, name, lat, long, date_start, date_end FROM accomodation");
	if (!$result) {

		echo $result->saveXML();
		exit;
	}

	//Through the list
	while ($row = pg_fetch_row($result)) {

 		//Accomodation
		$xmlAccomodation = $xmlRoot->appendChild( $xmlResult->createElement("accomodation") );

		//Data
		$xmlId = $xmlAccomodation->appendchild( $xmlResult->createElement("id", $row[0] ) );
		$xmlName = $xmlAccomodation->appendchild( $xmlResult->createElement("name", $row[1] ) );
		$xmlLat = $xmlAccomodation->appendchild( $xmlResult->createElement("lat", $row[2] ) );
		$xmlLong = $xmlAccomodation->appendchild( $xmlResult->createElement("long", $row[3] ) );
		$xmlLong = $xmlAccomodation->appendchild( $xmlResult->createElement("start_date", $row[4] ) );
		$xmlLong = $xmlAccomodation->appendchild( $xmlResult->createElement("end_date", $row[5] ) );


	}

	echo $xmlResult->saveXML();

?>
