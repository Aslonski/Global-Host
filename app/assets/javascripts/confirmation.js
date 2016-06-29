$(document).ready(function(){

  $(".confirm-button").on("click", function(event){
    $(this).addClass("hidden");
    $(".edit-button").removeClass("hidden");
    $(".activity-buttons").addClass("hidden");

  })

  $(".edit-button").on("click", function(){
    $(this).addClass("hidden");
    $(".confirm-button").removeClass("hidden");
    $(".activity-buttons").removeClass("hidden");
  })

})
