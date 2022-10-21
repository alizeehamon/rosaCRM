let modalToggler = document.getElementsByClassName("delete-modal-toggler")
let modalDelete = document.querySelector(".delete-modal-trigger")

let modaldeletehref = modalDelete.getAttribute("href")


function setId(e) {
    modalDelete.setAttribute("href" , modaldeletehref+  e)
}

for (let x = 0 ;  x < modalToggler.length ; x++){
    modalToggler[x].addEventListener("click" , e => setId(modalToggler[x].getAttribute("value") ))
}
