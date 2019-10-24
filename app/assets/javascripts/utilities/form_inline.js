document.addEventListener('turbolinks:load', function() {
  $('.form-inline-link').on('click', formInlineLinkHandler) // через jquery

//  var controls = document.querySelectorAll('.form-inline-link')

//  if (controls.length) {
//  for (var i = 0; i < controls.length; i++) {
//    controls[i].addEventListener('click', formInlineLinkHandler)
//    }
//  }

  var errors = document.querySelector('.resource-errors')
//  console.log(errors.innerHTML + ' is ERROR')
  if (errors) {
    var resourceId = this.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  var testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  // var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
  // var formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

  var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  var $formInline = $('.form-inline[data-test-id="' + testId + '"]')

  // if ($formInline.classList.contains('hide'))
  $formInline.toggle()
  $testTitle.toggle() // эта функция jquery автоматически включает и выключает видимость

  if ($formInline.is(':visible')) {
    link.textContent = 'Cancel'
  } else {
    link.textContent = 'Editt'
  }
}
