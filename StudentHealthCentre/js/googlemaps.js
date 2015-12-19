$(document).ready(function() {    
	function init_map()
	{
		var myOptions = { zoom: 15, center: new google.maps.LatLng(51.5112803, -0.1389976000000388), mapTypeId: google.maps.MapTypeId.ROADMAP };
		map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);
		marker = new google.maps.Marker({ map: map, position: new google.maps.LatLng(51.5112803, -0.1389976000000388) });
		infowindow = new google.maps.InfoWindow({ content: '<strong>Student Health Center</strong><br>Regent Street<br> London<br>' });
		google.maps.event.addListener(marker, 'click', function () { infowindow.open(map, marker); });
		infowindow.open(map, marker);
	} 
	
	google.maps.event.addDomListener(window, 'load', init_map);
})