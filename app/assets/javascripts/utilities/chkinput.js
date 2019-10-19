document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.chk-input')

  if (control) {control.addEventListener('keyup', viewField, 'useCapture') }
})

function viewField() {
  var firstString = document.getElementById("psy1").value;
  // console.log(firstString)
  inputToStr(firstString)
}

function inputToStr(firstString) {
  var secondString = document.getElementById("psy2").value;
  document.querySelector('.octicon-alert').classList.remove('hide')
  console.log(firstString)
  console.log(secondString)

  if (secondString == firstString) {
    document.querySelector('.octicon-alert').classList.add('hide')
    document.querySelector('.octicon-check').classList.remove("hide")
  }

}



  // NodeList (! не массив, подробнее ниже)
  // https://developer.mozilla.org/ru/docs/web/API/NodeList
  //

//  var rows = table.querySelectorAll('tr')
//  var sortedRows = []

  // select all table rows except first one which is header
//  for (var i = 1; i < rows.length; i++) {
//    sortedRows.push(rows[i])
//  }

  // var arrowUp = this.querySelector('.octicon-arrow-up')
  // var arrowDown = this.querySelector('.octicon-arrow-down')

  // console.log(arrowUp)

  // sortedRows.sort(compareRowsAsc)
//  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
//    sortedRows.sort(compareRowsAsc)
//    this.querySelector('.octicon-arrow-up').classList.remove('hide')
//    this.querySelector('.octicon-arrow-down').classList.add('hide')

//  } else {
  //  sortedRows.sort(compareRowsDesc)
  //  this.querySelector('.octicon-arrow-down').classList.remove('hide')
  //  this.querySelector('.octicon-arrow-up').classList.add('hide')
//  }

//  var sortedTable = document.createElement('table')

//  sortedTable.classList.add('table')
//  sortedTable.appendChild(rows[0])

//  for (var i = 0; i < sortedRows.length; i++) {
//    sortedTable.appendChild(sortedRows[i])
//  }

//  table.parentNode.replaceChild(sortedTable, table)
//}

//function compareRowsAsc(row1, row2) {
  //var testTitle1 = row1.querySelector('td').textContent
  //var testTitle2 = row2.querySelector('td').textContent

  // if (testTitle1 < testTitle2) { return -1 }
  // if (testTitle1 > testTitle2) { return 1 }
  // return 0
//}

// function compareRowsDesc(row1, row2) {
//   var testTitle1 = row1.querySelector('td').textContent
//   var testTitle2 = row2.querySelector('td').textContent

//   if (testTitle1 < testTitle2) { return 1 }
//   if (testTitle1 > testTitle2) { return -1 }
//   return 0
//}
