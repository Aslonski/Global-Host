var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: centerFinder(),
    zoom: 12
  });

  window.placesInfo.forEach(function(location_obj){
    // console.log(location_obj)
    return markerMaker(location_obj)
  })
}

function centerFinder(){
  if (window.placesInfo[0]["loc_lat_lng"] && (window.placesInfo.length > 0)) {
    return window.placesInfo[0]["loc_lat_lng"]
  } else {
    return window.mapCenterLocation
  }
};

function markerMaker(location_obj){
  var infoWindow = new google.maps.InfoWindow({
    content: location_obj["loc_name"]
  });

  var marker = new google.maps.Marker({
    position: location_obj["loc_lat_lng"],
    map: map,
    animation: google.maps.Animation.DROP
  });

  marker.addListener('click', function() {
    infoWindow.open(map, marker);
  });
}





