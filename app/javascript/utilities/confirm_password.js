document.addEventListener('turbolinks:load', function() {
  let confirmation = document.querySelector('.confirmation-password')

  if (confirmation) { confirmation.addEventListener('input', myInput)}
})

function myInput() {
  let password = document.querySelector('.password')

  let check = document.querySelector('.confirmation-password')

  if (password.value != check.value && check.value.length != 0) {
    check.classList.remove('success')
    check.classList.add('mistake')
  } else if (check.value == check.value && check.value.length != 0) {
    check.classList.remove('mistake')
    check.classList.add('success')
  } else {
    check.classList.remove('mistake')
    check.classList.remove('success')
  }
}

