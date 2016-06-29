$(document).ready(function(){
  $(".button-collapse").sideNav();

  $('.modal-trigger').leanModal();

  $('.datepicker').pickadate({
    selectMonths: true,
    selectYears: 5
  });
})

