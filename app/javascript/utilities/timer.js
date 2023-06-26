document.addEventListener('turbolinks:load',function() {

    let time = document.getElementById('time')

    if (time) {
      let testTime = time.dataset.testTimer

      setInterval(countDown, 1000)

      function countDown() {
        let minutes = Math.floor(testTime / 60)
        let seconds = testTime - minutes * 60

        let strTime = `${Math.trunc(minutes)}:${Math.trunc(seconds)}`

        if (testTime <= 1) {
          location.reload()
        }

        time.innerHTML = strTime
        testTime--
      }
    }
})
console.log('lalam')

