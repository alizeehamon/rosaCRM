let addressList = document.getElementsByClassName("entity-address")

let map = L.map('map').setView([51.505, -0.09], 13);

L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

function getAddressLatLn(address){
    return new Promise(resolve => {
        $.get(location.protocol + '//nominatim.openstreetmap.org/search?format=json&q=' + address.textContent, function(data){
            let localization = data[0];
            resolve(L.latLng(localization.lat, localization.lon));
        });
    })
}

async function getMarkerList(){
    let markerList = [];
    for(let address of addressList){
        let latLng = await getAddressLatLn(address);
        let marker = L.marker([latLng.lat, latLng.lng]).addTo(map);
        marker.bindPopup(address.textContent);
        markerList.push(marker);
    }

    let group = L.featureGroup(markerList);

    map.fitBounds(group.getBounds());
}

getMarkerList();













