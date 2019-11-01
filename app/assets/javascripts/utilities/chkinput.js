document.addEventListener('turbolinks:load', function() {
  var controlOne = document.querySelector('.chk-input-one')
  var controlConf = document.querySelector('.chk-input-conf')

  if (controlOne) {controlOne.addEventListener('keyup', checkField, 'useCapture') }
  if (controlConf) {controlConf.addEventListener('keyup', checkField, 'useCapture') }

})

function checkField() {
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
