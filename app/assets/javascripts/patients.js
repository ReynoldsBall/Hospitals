var x = "Hello World";
var number = 1;
var number2 = 2;
console.log(number + number2);
console.log(x + number);
console.log(number + x)
console.log(typeof number)
var array = [1,2,3,4];
console.log(array[0]);
var hash = {hello_world: "Hey Will"};
console.log(hash.hello_world);


$(document).ready(function() {
  // jQuery selector
  // DOM - Document Object Model
  console.log($('body'))
  console.log($('.col-xs-4'))
  console.log($('#asdf'))


  $(".hide_image_1").click( function() {
    console.log("Hello World");
    $(".image_1").toggle();
  })

  $(".show_image_1").click( function() {
    $(".image_1").show();    
  })


  $(".hide_image_2").click( function() {
    $(".image_2").hide();
  })

  $(".show_image_2").click( function() {
    $(".image_2").show();    
  })

  $(".toggle_images").click( function() {
    $(".car_image").toggle();
  })

  $(".toggle_images_with_logic").click( function() {
    // if condition
    //   do stuff
    // end

    // if(condition) {
    //   do stuff
    // }

    if( $(".car_image").is(":visible") ) {
      $(".car_image").hide()
    }
    else {
     $(".car_image").show()
    }
    
  })

  $(".image_1").hover( function() {
    // $("body").remove()

  })

  $(".add_student").click( function() {
    var new_name = $(".student_name").val()
    if(new_name != ""){
      $(".students_list").append("<li>" + new_name + "</li>")
      $(".student_name").val("")
    }
  })

  // pseudo selector
  $("li:first")
  $("li:last")
  $(".car_image:visible")
  $(".car_image:hidden")
  // multiple selectors
  $(".car_image, a.add_student")
  // children elements
  $("ul.students_list li")
  $("ul.students_list li:first")
  // Direct descendent
  $("ul.fruit > li")
  $("ul.fruit > li > ul > li:last")

  $("li.apple").click(function() {
    $(".apple_select").removeClass('hidden').toggle()
  })

  $("li.apple").parent()
  $("li.apple").parent().parent().parent().parent().parent()

  $("li.apple").children()

  // Goes UP the tree
  $("li.apple").closest('.container')

  // Goes DOWN the tree
  $(".container").find('li.apple')

  $("ul.fruit li").not("li.apple")

  // HTML Attributes
  $("li.apple").attr("class")
  $("input:last").attr("value")
  // Setting HTML attributes
  $("input:last").attr("value", "Dude, you done did somethin' bad").attr("class", "btn btn-lg btn-warning")

  // append/remove
  $("ul.fruit").append("<li>Mango</li>")
  $("ul.fruit").prepend("<li>Grapes</li>")
  // $("ul.fruit").html("<li>Chocolate</li>")
  // $("ul.fruit").empty()

  $("li").click( function() {
    $(this).remove()
  })

})









