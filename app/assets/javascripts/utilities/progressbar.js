//document.addEventListener('turbolinks:load', function() {

  // var rec = document.getElementById("example"),
  //  ctx = rec.getContext('2d');
  //  ctx.fillRect(0, 0, rec.width, rec.height);

  //var questionCount = document.getElementById('questionCount').innerHTML
  //console.log(questionCount)

  // for (var i = 0; i < questionCount; i++) {
    // console.log(i + " question");
  //  if (rec = document.getElementById(i)) {
  //    rec = document.getElementById(i),
  //    ctx = rec.getContext('2d');
  //    ctx.fillRect(0, 0 + i * 10, rec.width + i*20, rec.height);
  //  }
  // }
// })
document.addEventListener('turbolinks:load', function() {
  var countOfQuestions = document.querySelector(".countOfQuestions").innerHTML
  var currentQuestionNumber = document.querySelector(".currentQuestionNumber").innerHTML;

  console.log(countOfQuestions)
  console.log(currentQuestionNumber)

  //<% i = @test_passage.current_question.id %>

  var j = 0;
  console.log(j)

  while (j < currentQuestionNumber)  {
    var canvas = document.getElementById("canvas1")
//      var recStroke = document.getElementById("<%= j %>"),
        ctx = canvas.getContext('2d');
  			document.getElementById("canvas1").width = 30+ j*30;
        ctx.fillRect(0, 0, canvas.width, canvas.height);


//      var recFill = document.getElementById("<%= currentQuestionNumber-1 %>"),
//        ctx = recFill.getContext('2d');
//  			ctx.fillRect(0, 0, recFill.width, recFill.height);
        j = j + 1;
  console.log(j)
  console.log(j-currentQuestionNumber)
}

})
