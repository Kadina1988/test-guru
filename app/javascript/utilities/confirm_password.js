document.addEventListener('turbolinks:load', function() {
  let confirmInput = document.getElementById('confirmation-password')
  let passInput = document.getElementById('password')

  if (confirmInput) { confirmInput.addEventListener('input', myInput)
                      passInput.addEventListener('input', myInput) }
})

function myInput() {
  let password = document.getElementById('password')
  let check = document.getElementById('confirmation-password')

  if (password.value != check.value && check.value.length != 0 ) {
    password.classList.remove('success')
    password.classList.add('mistake')
  } else if (check.value === check.value && check.value.length != 0) {
    password.classList.remove('mistake')
    password.classList.add('success')
  } else {
    password.classList.remove('mistake')
    password.classList.remove('success')
  }
}


