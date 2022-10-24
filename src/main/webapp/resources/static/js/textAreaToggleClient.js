let textAreaToggleClients = document.getElementsByClassName("text-areaControl")

for(let textarea of textAreaToggleClients){
    textarea.addEventListener("click" , e => textarea.removeAttribute("readonly") )
}