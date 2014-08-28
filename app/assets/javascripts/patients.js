// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){
  $('#patient_firstname').keyup(function(){
    if ($(this).val() != ""&& $('#patient_DOB').val() != "" && $('#patient_firstname').val() != "" && $('#patient_lastname').val() != "" && $('#patient_description').val() != "" && $('#patient_gender').val() != ""){
         $(".patient_submit").removeAttr("disabled").addClass("btn-danger").removeClass("btn-warning");
       }
    else{
       $(".patient_submit").removeAttr("disabled");
    }
      // $(this).attr("disabled", "disabled")
      // console.log("Rob");
}
  )

  $('#patient_lastname').keyup(function(){
    if ($(this).val() != ""&& $('#patient_DOB').val() != "" && $('#patient_firstname').val() != "" && $('#patient_gender').val() != "" && $('#patient_description').val() != "" && $('#patient_firstname').val() != ""){
         $(".patient_submit").removeAttr("disabled").addClass("btn-danger").removeClass("btn-warning");
       }
    else{
       $(".patient_submit").removeAttr("disabled");
    }
      // $(this).attr("disabled", "disabled")
      // console.log("Rob");
}
  )
  $('#patient_DOB').keyup(function(){
    if ($(this).val() != ""&& $('#patient_gender').val() != "" && $('#patient_firstname').val() != "" && $('#patient_lastname').val() != "" && $('#patient_description').val() != "" && $('#patient_firstname').val() != ""){
         $(".patient_submit").removeAttr("disabled").addClass("btn-danger").removeClass("btn-warning");
       }
    else{
       $(".patient_submit").removeAttr("disabled");
    }
      // $(this).attr("disabled", "disabled")
      // console.log("Rob");
}
  )
  $('#patient_gender').keyup(function(){
    if ($(this).val() != "" && $('#patient_DOB').val() != "" && $('#patient_firstname').val() != "" && $('#patient_lastname').val() != "" && $('#patient_description').val() != "" && $('#patient_firstname').val() != ""){
         $(".patient_submit").removeAttr("disabled").addClass("btn-danger").removeClass("btn-warning");
       }
    else{
       $(".patient_submit").removeAttr("disabled");
    }
      // $(this).attr("disabled", "disabled")
      // console.log("Rob");
}
  )
  $('#patient_description').keyup(function(){
    if ($(this).val() != ""&& $('#patient_DOB').val() != "" && $('#patient_firstname').val() != "" && $('#patient_lastname').val() != "" && $('#patient_gender').val() != "" && $('#patient_firstname').val() != ""){
         $(".patient_submit").removeAttr("disabled").addClass("btn-danger").removeClass("btn-warning");
       }
    else{
       $(".patient_submit").removeAttr("disabled");
    }
      // $(this).attr("disabled", "disabled")
      // console.log("Rob");
}
  )
})