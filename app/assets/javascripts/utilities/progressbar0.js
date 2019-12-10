document.addEventListener('turbolinks:load', function() {
  var bar = document.querySelector('#bar')

  if (bar) {
    var progressSize =  bar.dataset.count
    var progressCurrent =  bar.dataset.questionIndex

    console.log("questionIndex is " + progressCurrent)
    console.log("count is " + progressSize)



    progressBar(progressSize, progressCurrent)
  }
})


function progressBar(progressSize, progressCurrent) {
  var j = 0;
  while (j < progressCurrent)  {
    var canvas = document.getElementById("canvas2")
    ctx = canvas.getContext('2d');
   	document.getElementById("canvas2").width = 30+ j*30;
      ctx.fillStyle = "green";
    ctx.fillRect(0, 5, canvas.width, canvas.height);
    j = j + 1;
  }
}
