let startTimeInput = document.getElementById("startTimeInput")
let endTimeInput = document.getElementById("endTimeInput")
let fullDayBox = document.getElementById("fullday")


fullDayBox.addEventListener('change', function() {
    if (this.checked) {
        startTimeInput.value = "00:00"
        endTimeInput.value = "23:59"
    }
});