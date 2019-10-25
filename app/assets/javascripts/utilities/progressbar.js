
document.addEventListener('turbolinks:load', function() {
  var countOfQuestions = document.querySelector(".countOfQuestions").innerHTML
  var currentQuestionNumber = document.querySelector(".currentQuestionNumber").innerHTML;

  var j = 0;

  while (j < currentQuestionNumber)  {
    var canvas = document.getElementById("canvas1")
        ctx = canvas.getContext('2d');
  			document.getElementById("canvas1").width = 30+ j*30;
        ctx.fillStyle = "green";
        ctx.fillRect(0, 5, canvas.width, canvas.height);
        j = j + 1;
  }
})
