document.addEventListener('turbolinks:load', function() {
  let confirmation = document.querySelector('.confirmation-password')

  if (confirmation) { confirmation.addEventListener('input', myInput)}
})

function myInput() {
  let password = document.querySelector('.password')

  let check = document.querySelector('.confirmation-password')

  if (password.value != check.value && check.value.length != 0) {
    password.classList.remove('success')
    password.classList.add('mistake')
  } else if (check.value == check.value && check.value.length != 0) {
    password.classList.remove('mistake')
    password.classList.add('success')
  } else {
    password.classList.remove('mistake')
    password.classList.remove('success')
  }
}
console.log(3)
