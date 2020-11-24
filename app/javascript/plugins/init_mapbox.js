import mapboxgl from 'mapbox-gl';

const initMapbox = async () => {
  const mapElement = document.getElementById('map');
  if (!mapElement) return; // only build a map if there's a div#map to inject into


  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    center: [2.34, 48.85], // starting position
    zoom: 4
  });
  // locateUser(map);
  const userPosition = navigator.geolocation.getCurrentPosition((position) => {
    locateUser(map, position);
  });
};

const locateUser = (map, position) => {
  const mapElement = document.getElementById('map');
  console.log(position)
  if (!mapElement) return; // only build a map if there's a div#map to inject into

  map.flyTo({center: [position.coords.longitude, position.coords.latitude],
    zoom: 12,
    speed: 0.6, // make the flying slow
    curve: 1, // change the speed at which it zooms out
  });
}

export { initMapbox };
