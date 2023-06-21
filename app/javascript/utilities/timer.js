document.addEventListener('turbolinks:load',function() {
    let time = document.getElementById('time')
    let testTime = time.dataset.testTimer

    let fullTime = testTime * 60

    if (time) { console.log("It's time" ) }

    // if (time) setInterval(function() {

    //     let seconds = fullTime%60
    //     let minutes = fullTime/60%60
    //     let strTimer = `${Math.trunc(minutes)}:${Math.trunc(seconds)}`
    //     time.innerHTML = strTimer
    //     fullTime--

    // }, 1000)
})

