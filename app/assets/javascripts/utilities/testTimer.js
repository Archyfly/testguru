document.addEventListener('turbolinks:load', function() {
  var testDuration = document.querySelector('.setTestDuration').innerHTML
  // var timeNow = document.querySelector('.timeNow')
  if (testDuration) {
  console.log(testDuration)
  let duration = testDuration*60000;
   console.log(duration)
  if (duration) { setTimeout(sayHi, duration); }
  }

})

function sayHi() {
  alert('Время на тест закончилось, иди домой');
}
