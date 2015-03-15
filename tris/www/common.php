<?php

	//error_reporting(E_ALL);
	//ini_set('display_errors', 1); //Needs to be here to see error message on the page, otherwise it ignors the error

	$ini = parse_ini_file( "tris.ini", true );
	
	$webprotocol = $ini["web"]["webprotocol"];
	$webhost = $ini["web"]["webhost"];
	$webpath = $ini["web"]["webpath"];	
	$language = $ini["international"]["language"];
	
	
	$language_file="translation_" . $language . ".ini";

	$translation = parse_ini_file( $language_file, true );
	
	function getWebURLString(){		 		
		global $webprotocol;
		global $webhost;
		global $webpath;
		return $webprotocol . $webhost . $webpath;
	}
	
	function getTranslation($to_translate){
		global $translation;
		$translated = $translation[ $to_translate ];
		if( empty( $translated ) ){
			return $to_translate;
		}else{
			return $translated;
		}
	}
?>
