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
  var mapOptions = {
    zoom: 12,
    center: new google.maps.LatLng(11.004051,-74.815033),
    mapTypeId: google.maps.MapTypeId.ROADMAP,

  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  geocoder = new google.maps.Geocoder();
  

google.maps.event.addListener(map,'click',function(event) { 
  if(confirm('Al darle click al mapa se registrara su posicion, si ya la habia registrado su posicion antes está sera reemplazada, desea hacer esto?')){
  clearOverlays(markersArray);
  document.getElementById('lat').innerHTML=event.latLng.lat();
  document.getElementById('lng').innerHTML=event.latLng.lng();
  document.getElementById('lat-form').value=event.latLng.lat();
  document.getElementById('lng-form').value=event.latLng.lng();

  var myLatlng = new google.maps.LatLng(event.latLng.lat(),event.latLng.lng());
  marcador=new Object();
  marcador.contenido="Aquí estoy yo";
   marcador.marker= new google.maps.Marker({
    position: myLatlng,
    map: map,
    title: 'Estoy aqui'
  }); markersArray.push(marcador.marker);
  //Funciona, agregar mensaje sobre marcadores
  google.maps.event.addListener(marcador.marker,'click',function(){
    var infoWindow = new google.maps.InfoWindow();
        infoWindow.setContent(marcador.contenido);
        infoWindow.setPosition(marcador.marker.getPosition());
        infoWindow.open(map,this);
       }) 
    }}) 



}


function cambiarDireccion(){
clearOverlays(markersArray);
var address = document.getElementById('address').value;
  geocoder.geocode( { 'address': address}, function(results, status) {
    console.log(results);
    console.log(status);
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      marcador=new Object();
      marcador.contenido="Aquí estoy yo";
      marcador.marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      }); markersArray.push(marcador.marker); 
      var lat_punto =results[0].geometry.location.lat();
      var lng_punto =results[0].geometry.location.lng();
      console.log(lat_punto);
      console.log(lng_punto);
      document.getElementById('lat-form').value=lat_punto;
  document.getElementById('lng-form').value=lng_punto;
     // alert('El punto encontrado tiene la siguiente latitud y longitud '+lat_punto+' , '+lng_punto);
        google.maps.event.addListener(marcador.marker,'click',function(){
    var infoWindow = new google.maps.InfoWindow();
        infoWindow.setContent(marcador.contenido);
        infoWindow.setPosition(marcador.marker.getPosition());
        infoWindow.open(map,this);
       }) 

    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });


}

function codeAddress() {
  clearOverlays(GeocoderMarkersArray); //borar los puntos ya escritos en el mapa
  var address = document.getElementById('address').value;
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      var objmarcador=new Object();
      objmarcador.contenido="Este es el contenido, miralo e_é";
      objmarcador.marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      }); GeocoderMarkersArray.push(objmarcador.marker); 
      var lat_punto =results[0].geometry.location.lat();
      var lng_punto =results[0].geometry.location.lng();
    //  alert('El punto encontrado tiene la siguiente latitud y longitud '+lat_punto+' , '+lng_punto);
        google.maps.event.addListener(objmarcador.marker,'click',function(){
    var infoWindow = new google.maps.InfoWindow();
        infoWindow.setContent(objmarcador.contenido);
        infoWindow.setPosition(objmarcador.marker.getPosition());
        infoWindow.open(map,this);
       }) 

    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}




function clearOverlays(markersArray) {
  for (var i = 0; i < markersArray.length; i++ ) {
    markersArray[i].setMap(null);
  }
  markersArray = [];
}


google.maps.event.addDomListener(window, 'load', initialize);
