document.addEventListener('turbolinks:load', function() {

    let bar = document.getElementById('myBar')

    if (bar) {
      let questionNumber = bar.dataset.questionNumber
      let questionCount  = bar.dataset.allQuestion
      let width = questionNumber * 100 / questionCount

      bar.style.width = width + '%'
    }
  })


