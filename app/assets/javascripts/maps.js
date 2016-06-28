// https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyDHNVo3T3tcjPrSGTh9ifxZy5m7Cnbozxs

$(document).ready(function(){
  var mapCenter = $('#itin-city').text()
});

var map;

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 48.8566, lng: 2.3522},
    zoom: 8
  });
}

// geocoder = new google.maps.Geocoder();
// geocoder.geocode({ 'address': mapCenter}, function(results, status) {
//   if (status == google.maps.GeocoderStatus.OK) {
//     map.setCenter(results[0].geometry.location);
//     console.log(results)
//   }
// });

// Drop marker
var myLatLng = {lat: 48.8867, lng: 2.3431}

var marker = new google.maps.Marker({
  position: myLatLng,
  map: map,
  animation: google.maps.Animation.DROP,
  title: 'Hello World!'
});

// Geocode current location
// var infoWindow = new google.maps.InfoWindow({map: map});

// if (navigator.geolocation) {
//   navigator.geolocation.getCurrentPosition(function(position) {
//     var pos = {
//       lat: position.coords.latititude,
//       lng: position.coords.longitude
//     };

//     infoWindow.setPosition(pos);
//     infoWindow.setContent('Location found.');
//     map.setCenter(pos);
//   }, function() {
//     handleLocationError(true, infoWindow, map.getCenter());
//   });
// } else {
//   handleLocationError(false, infoWindow, map.getCenter());
//   }

// function handleLocationError(browserHasGeolocation, infoWindow, pos) {
//   infoWindow.setPosition(pos);
//   infoWindow.setContent(browserHasGeolocation ?
//     'Error: The Geolocation service failed.' :
//     'Error: Your browswer doesn\'t support geolocation.');
// }
