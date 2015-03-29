function setCookie(key, value) {
	var expires = new Date();
	expires.setTime(expires.getTime() + (1 * 24 * 60 * 60 * 1000));
	document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
}

function getCookie(key) {
	var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
	return keyValue ? keyValue[2] : null;
}

/**
 * A MAP rendelkezesere allo fuggoleges helyet szamolja ki es allitja be.
 * Gond, hogy a #map_canvas DIV rendelkezik egy bordere, amit a class allit be  
 */
function resizeMapCanvas(){
    var upperMenulineHeight = $("#upper_menuline").outerHeight(true);
    var htmlHeight = $( document ).height();    
    var borderHeight = ( $('#map_canvas').outerHeight(true) - $('#map_canvas').outerHeight() ) + ( $('#map_canvas').outerHeight() - $('#map_canvas').innerHeight() ) + ( $('#map_canvas').innerHeight() - $('#map_canvas').height() );
    $('#map_canvas').css('height', ( htmlHeight - upperMenulineHeight - borderHeight ) );
}
