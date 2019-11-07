document.addEventListener('turbolinks:load', function() {
  var testDuration = document.querySelector('.setTestDuration').innerHTML
  // var timeNow = document.querySelector('.timeNow')

  console.log(testDuration)
  let duration = testDuration*1000; // только для проверки, заменить на 60000 если берем минуты
  console.log(duration)
  if (duration > 0) { setTimeout(sayHi, duration); }
})

function sayHi() {
  alert('Время на тест закончилось, иди домой');
}
