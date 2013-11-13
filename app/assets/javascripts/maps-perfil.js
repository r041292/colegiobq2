var map;
var geocoder;
var marcador;
var objmarcador=new Object();
objmarcador.marker=null;
objmarcador.contenido="";
var markersArray = [];
var GeocoderMarkersArray = [];
var TILE_SIZE = 256;

function initialize() {

  var lat=document.getElementById('lat').innerHTML;
  var lng=document.getElementById('lng').innerHTML;

  var mapOptions = {
    zoom: 15,
    center: new google.maps.LatLng(lat,lng),
    mapTypeId: google.maps.MapTypeId.ROADMAP,

  };

  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  geocoder = new google.maps.Geocoder();


  
  var myLatlng = new google.maps.LatLng(lat,lng);
  marcador=new Object();
   marcador.marker= new google.maps.Marker({
    position: myLatlng,
    map: map,
    title: 'Colegio'
  }); markersArray.push(marcador.marker);


}






function clearOverlays(markersArray) {
  for (var i = 0; i < markersArray.length; i++ ) {
    markersArray[i].setMap(null);
  }
  markersArray = [];
}


google.maps.event.addDomListener(window, 'load', initialize);
