document.addEventListener('turbolinks:load', function() {
  let confirmation = document.getElementById('confirmation-password')

  if (confirmation) { confirmation.addEventListener('input', myInput)}
})

function myInput() {
  let password = document.getElementById('password')

  let check = document.getElementById('confirmation-password')

  if (password.value !== check.value && (check.value.length != 0 || password.value.length > check.value.length)) {
    password.classList.remove('success')
    password.classList.add('mistake')
  } else if (check.value === check.value && check.value.length != 0) {
    password.classList.remove('mistake')
    password.classList.add('success')
  } else {
    password.classList.remove('mistake')
    password.classList.remove('success')
  }

  if (password.value.length != check.value.length) {
    console.log('super')
  }
}

console.log('s')
