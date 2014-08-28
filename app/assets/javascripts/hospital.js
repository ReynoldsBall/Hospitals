// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){
  $('#hospital_name').keyup(function(){
    if ($(this).val() != ""){
         $(".hospital_submit").removeAttr("disabled").addClass("btn-danger").removeClass("btn-warning");
       }
    else{
       $(".hospital_submit").removeAttr("disabled");
    }
      // $(this).attr("disabled", "disabled")
      // console.log("Rob");
}
  )
})
