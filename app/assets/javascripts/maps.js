var map;

function initMap() {
  function centerFinder(){
    if (window.locationsCollection && (window.locationsCollection.length > 0)) {
      return window.locationsCollection[0]
    } else {
      return window.mapCenterLocation
    }
  };

  map = new google.maps.Map(document.getElementById('map'), {
    center: centerFinder(),
    zoom: 12
  });

  window.locationsCollection.forEach(function(location){
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
