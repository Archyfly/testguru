document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.chk-input')

  if (control) {control.addEventListener('keyup', viewField, 'useCapture') }
})

function viewField() {
  var firstString = document.getElementById("psy1").value;
  var secondString = document.getElementById("psy2").value;

  document.querySelector('.octicon-alert').classList.remove('hide')

  if (secondString == firstString) {
    document.querySelector('.octicon-alert').classList.add('hide')
    document.querySelector('.octicon-check').classList.remove("hide")
  } else {
    document.querySelector('.octicon-alert').classList.remove('hide')
    document.querySelector('.octicon-check').classList.add("hide")
  }
}
