let textareaToggleProspects = document.getElementsByClassName("text-areaControl")

for(let textarea of textareaToggleProspects){
    textarea.addEventListener("click" , e => textarea.removeAttribute("readonly") )
}