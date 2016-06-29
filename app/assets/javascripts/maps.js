$(document).ready(function(){

});

var map;

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: window.mapCenterLocation,
    zoom: 12
  });

  window.locationsCollection.forEach(function(location){
    console.log(location)
    return markerMaker(location)
  })
}

function markerMaker(location){
  var marker = new google.maps.Marker({
    position: location,
    map: map,
    animation: google.maps.Animation.DROP
  });
}
