$(document).ready(function(){

});

var map;

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: window.mapCenterLocation,
    zoom: 12
  });

  // Bring in collection of location coordinates
  window.locationsCollection.forEach(function(location){
    console.log(location)
    return markerMaker(location)
  })
  // Drop a marker for each
}

function markerMaker(location){
  var marker = new google.maps.Marker({
    position: location,
    map: map,
    animation: google.maps.Animation.DROP
  });
}
