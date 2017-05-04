$(window).load(function() {
	loadScript();
});

var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -34.397, lng: 150.644},
    zoom: 8
  });
}


//Adding google API script tag
function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
    '&key=AIzaSyApukely-nToq2fH9wsW5GBQ4KZNnPwPzw'+
    '&libraries=drawing'+
    '&callback=initMap';
  document.body.appendChild(script);
}