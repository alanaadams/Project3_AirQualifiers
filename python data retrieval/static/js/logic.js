// Create get color function for earthquake depth
function getColor(depth) {
  switch (true) {
    case depth <= 0:
      return "#006400"; // darkgreen
    case depth <= 5:
      return "#008000"; // green
    case depth <= 10:
      return "#90EE90"; // lightgreen
    case depth <= 15:
      return "#FFFF00"; // yellow
    case depth <= 20:
      return "#FFA500"; // orange
    case depth <= 25:
      return "#FFC0CB"; // pink
    case depth <= 30:
      return "#FF0000"; // red
    case depth <= 35:
      return "#8B0000"; // darkred
    case depth > 35:
      return "#800080"; // purple
    default:
      return "#000000"; // black
  }
}

function createMap(air) {
  // Create the tile layer that will be the background of our map.
  let streetmap = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
  });

  // Create a baseMaps object to hold the streetmap layer.
  let baseMaps = {
    "Street Map": streetmap
  };

  // Create an overlayMaps object to hold the earthquakes layer.
  let overlayMaps = {
    "Air Quality": air
  };

  let overlayMapshHeat = {
    "Air Quality Heat": air
  };


  // Create the map object.
  let map = L.map("map", {
    center: [41.4925, -99.9018],
    zoom: 4,
    layers: [streetmap, air]
  });

  // Create a layer control, and pass it baseMaps and overlayMaps. Add the layer control to the map.
  L.control.layers(baseMaps, overlayMaps, overlayMapshHeat,{
    collapsed: false
  }).addTo(map);

  // Create legend
  let legend = L.control({ position: 'bottomright' });

  legend.onAdd = function () {

    let div = L.DomUtil.create('div', 'legend'),
      depth_level = [0, 5, 10, 15, 20, 25, 30, 35];


    // loop through depth levels and generate a label with a colored square for each.
    for (var i = 0; i < depth_level.length; i++) {
      div.innerHTML +=
        '<i style="background:' + getColor(depth_level[i] + 1) + '"></i> ' +
        depth_level[i] + (depth_level[i + 1] ? '&ndash;' + depth_level[i + 1] + '<br>' : '+');
    }

    return div;
  };

  legend.addTo(map);

}

function createMarkers(response) {

      // Pull features from response.
      //let features = response.features.properties;

      // Initialize an array to hold earthquake markers.
      let airMarkers = [];

      // Loop through the earthquake array.
      for (let index = 0; index < response.features.length; index++) {

          // For each station, create a marker, and bind a popup with the station's name.
        let airMarker = L.marker([response.features[index].properties.latitude, response.features[index].properties.longitude])
          .bindPopup("<h3>" + response.features[index].properties.country + "<h3><h3>Location: " + response.features[index].properties.location + "<h3><h3>pm25: " + response.features[index].properties.value + " " + response.features[index].properties.unit + "</h3>");

          // Add the marker to the earthquake array.
             airMarkers.push(airMarker);
       }
      
  let airCirlces = [];

  for (let index = 0; index < response.features.length; index++) {
    let airCirlce = L.circle([response.features[index].properties.latitude, response.features[index].properties.longitude], {
      color: getColor(response.features[index].properties.value),
      fillColor: getColor(response.features[index].properties.value),
      fillOpacity: 0.5,
      radius: 50000
    }).bindPopup("<h3>" + response.features[index].properties.country + "<h3><h3>Location: " + response.features[index].properties.location + "<h3><h3>pm25: " + response.features[index].properties.value + " " + response.features[index].properties.unit + "</h3>");
    airCirlces.push(airCirlce);
  }

  

       // Create a layer group that's made from the earthquake array, and pass it to the createMap function.
  createMap(L.layerGroup(airCirlces));
        // L.layerGroup(airCirlces).addTo(map);


}

// function createHeat(response) {
//   let airCirlces = [];

//   for (let index = 0; index < response.features.length; index++) {
//       let airCirlce = L.circle([response.features[index].properties.latitude, response.features[index].properties.longitude], {
//         color: getColor(response.features[index].properties.value),
//         fillColor: getColor(response.features[index].properties.value),
//       fillOpacity: 0.5,
//       radius: 50000
//     })
//     airCirlces.push(airCirlce);
//   }
  
//   L.layerGroup(airCirlces).addTo(map);
// }

d3.json("http://localhost:8000/pm25G.geojson").then(createMarkers);
