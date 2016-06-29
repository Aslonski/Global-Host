var map;

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: centerFinder(),
    zoom: 12
  });

  window.locationsCollection.forEach(function(location){
    return markerMaker(location)
  })
}

function centerFinder(){
  if (window.locationsCollection && (window.locationsCollection.length > 0)) {
    return window.locationsCollection[0]
  } else {
    return window.mapCenterLocation
  }
};


function markerMaker(location){
var infoWindow = new google.maps.InfoWindow({
  content: "HEY FUCKFACE"
});
  var marker = new google.maps.Marker({
    position: location,
    map: map,
    animation: google.maps.Animation.DROP
  });


  marker.addListener('click', function() {
    infoWindow.open(map, marker);
  });
}



