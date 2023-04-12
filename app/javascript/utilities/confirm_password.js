document.addEventListener('turbolinks:load', function() {
    var confirmation = document.querySelector('.confirmation-password')

    if (confirmation) { confirmation.addEventListener('input', myInput)}
})

function myInput() {
    var password = document.querySelector('.password')

    var check = document.querySelector('.confirmation-password')

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

