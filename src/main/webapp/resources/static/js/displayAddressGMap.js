let addressList = document.getElementsByClassName("entity-address")

for(let entity of addressList){
    entity.setAttribute("href" , "https://www.google.fr/maps/search/" + entity.textContent )
}