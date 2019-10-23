document.addEventListener('turbolinks:load', function() {
  // var rec = document.getElementById("example"),
  //  ctx = rec.getContext('2d');
  //  ctx.fillRect(0, 0, rec.width, rec.height);

  var questionCount = document.getElementById('questionCount').innerHTML
  console.log(questionCount)

  for (var i = 0; i < questionCount; i++) {
    //console.log(i + " question");
    if (rec = document.getElementById(i)) {
      rec = document.getElementById(i),
      ctx = rec.getContext('2d');
      ctx.fillRect(0, 0 + i * 10, rec.width + i*20, rec.height);
    }
  }
})
