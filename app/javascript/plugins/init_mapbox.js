import mapboxgl from 'mapbox-gl';

const initMapbox = async () => {
  const mapElement = document.getElementById('map');
  if (!mapElement) return; // only build a map if there's a div#map to inject into



  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/nicode80/ckhwgqtuw0xvk1aoe3yvx7g9k',
    center: [2.34, 48.85], // starting position
    zoom: 6
  });
  // locateUser(map);
  const userPosition = navigator.geolocation.getCurrentPosition((position) => {
    locateUser(map, position);
  });

  const markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

  // Create a HTML element for your custom marker
  const organisationPic = document.createElement('div');
        organisationPic.className = 'marker';
        organisationPic.style.backgroundImage = `url('${marker.image_url}')`;
        organisationPic.style.backgroundSize = 'contain';
        organisationPic.style.width = '50px';
        organisationPic.style.height = '50px';
        organisationPic.style.borderRadius = '50%';
        organisationPic.style.border = '1px solid white';
        organisationPic.style.boxShadow = "0px 0px 20px grey";

    new mapboxgl.Marker(organisationPic)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
  // fitMapToMarkers(map, markers);

};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const locateUser = (map, position) => {
  const mapElement = document.getElementById('map');
  console.log(position)
  if (!mapElement) return; // only build a map if there's a div#map to inject into

  map.flyTo({center: [position.coords.longitude, position.coords.latitude],
    zoom: 11,
    speed: 0.8, // make the flying slow
    curve: 1, // change the speed at which it zooms out
  });
};


export { initMapbox };
