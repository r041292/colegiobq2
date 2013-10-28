var map;
var marcador;
var markersArray = [];

$(function initialize() {
  var mapOptions = {
    zoom: 12,
    center: new google.maps.LatLng(11.004051,-74.815033),
    mapTypeId: google.maps.MapTypeId.ROADMAP,

  };
  map = new google.maps.Map(document.getElementById('map-canvas-adm'),mapOptions);
  

google.maps.event.addListener(map,'click',function(event) {  
  clearOverlays(markersArray);
  document.getElementById('colegio_latitud').value=event.latLng.lat();
  document.getElementById('colegio_longitud').value=event.latLng.lng(); 

  var myLatlng = new google.maps.LatLng(event.latLng.lat(),event.latLng.lng());
  marcador=new Object();
  marcador.contenido="Aqui se encuentra el colegio";
  
   marcador.marker= new google.maps.Marker({
    position: myLatlng,
    map: map,
    title: 'Colegio'
  }); markersArray.push(marcador.marker);
  //Funciona, agregar mensaje sobre marcadores
  google.maps.event.addListener(marcador.marker,'click',function(){
    var infoWindow = new google.maps.InfoWindow();
        infoWindow.setContent(marcador.contenido);
        infoWindow.setPosition(marcador.marker.getPosition());
        infoWindow.open(map,this);
       }) 
    }) 



});


function clearOverlays(markersArray) {
  for (var i = 0; i < markersArray.length; i++ ) {
    markersArray[i].setMap(null);
  }
  markersArray = [];
}


google.maps.event.addDomListener(window, 'load', initialize);
