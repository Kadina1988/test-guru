document.addEventListener('turbolinks:load',function() {
  let start = document.getElementById('start')
  if (start) {start.addEventListener('click', showTime)}
})
  function showTime() {
    let time = document.getElementById('time')

    if (time) {
      let testTime = time.dataset.testTimer
      let fullTime = testTime * 60

      setInterval(countDown, 1000)

      function countDown() {
        let seconds = fullTime%60
        let minutes = fullTime/60%60
        let strTimer = `${Math.trunc(minutes)}:${Math.trunc(seconds)}`

        time.innerHTML = strTimer
        fullTime--
      }
    }
  }
console.log('work bitch')

