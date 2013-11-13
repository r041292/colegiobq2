var map;
var geocoder;
var marcador;
var colArray= [];
var infoWindow = new google.maps.InfoWindow();
var TILE_SIZE = 256;

function initialize() {
  var mapOptions = {
    zoom: 13,
    center: new google.maps.LatLng(11.004051,-74.815033),
    mapTypeId: google.maps.MapTypeId.ROADMAP,

  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  geocoder = new google.maps.Geocoder();
  
  var results = document.getElementById('resultado').value;  
  var resul1 = [];
  resul1=results.split(";");

  var marcadores= new Array();

for (x in resul1){

 var resul1split= resul1[x].split(",");
 
 var temp= new Object();
 temp.ubicacion= new google.maps.LatLng(resul1split[1],resul1split[2]);
 temp.contenido= resul1split[0];

var a=temp.ubicacion.lat();
if (!isNaN(a)){

 marcadores.push(temp);
}

}

setMarkers(marcadores);

}



function setMarkers(markerArray){
for(x in markerArray){
   var a=markerArray[x].ubicacion.lat();
  if (!isNaN(a)){
    var marcTemp = new Object();
    marcTemp.marker=  new google.maps.Marker({
          map: map,
          position: markerArray[x].ubicacion
      });
  
    marcTemp.contenido=markerArray[x].contenido;    
    
    

 google.maps.event.addListener(marcTemp.marker,'click',function(event){
        
        infoWindow.setContent(findContenido(event));
        
        infoWindow.setPosition(marcTemp.marker.getPosition());
        infoWindow.open(map,this);
        

       }) 
    }
colArray.push(marcTemp);

}

}

function findContenido(event){
  for (x in colArray){
    if( colArray[x].marker.getPosition()==event.latLng){      
      var thisis=x;
    }
    
  }
return colArray[thisis].contenido;
}

function clearOverlays(markersArray) {
  for (var i = 0; i < markersArray.length; i++ ) {
    markersArray[i].setMap(null);
  }
  markersArray = [];
}


google.maps.event.addDomListener(window, 'load', initialize);
