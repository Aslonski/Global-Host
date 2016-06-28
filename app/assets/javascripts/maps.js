$(document).ready(function(){

});

var map;

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: window.mapCenterLocation,
    zoom: 12
  });

  var marker = new google.maps.Marker({
    position: window.mapCenterLocation,
    map: map,
    animation: google.maps.Animation.DROP
  });
}

