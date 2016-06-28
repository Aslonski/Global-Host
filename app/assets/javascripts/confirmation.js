$(document).ready(function(){

  $(".confirm-button").on("click", function(event){
    event.preventDefault();
    console.log("howdy");
    $(".edit-button").removeClass("hidden");
    $(this).addClass("hidden");
    $(".update-activity-button").addClass("hidden");
    $(".remove-activity-button").addClass("hidden");
  })


})
