function initialize_maps() {
  google.maps.visualRefresh = true;
  map = new google.maps.Map(document.getElementById('map-canvas'), {
    center: new google.maps.LatLng(40.7527987, -73.974788),
    zoom: 12,
    mapTypeControl: true,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  var markers = new Array;
  var infoWindows = new Array;
  for (var i = 0; i < gon.locations.length; i++) {
    infoWindows[i] = new google.maps.InfoWindow({
      content: gon.locations[i].primary_contact_name,
      position: new google.maps.LatLng(gon.locations[i].latitude, gon.locations[i].longitude)
    });
    markers[i] = new google.maps.Marker({ 
      position: new google.maps.LatLng(gon.locations[i].latitude, gon.locations[i].longitude),
      map: map,
      title: gon.locations[i].primary_contact_name
    });
  }
}

google.maps.event.addDomListener(window, 'load', initialize_maps);