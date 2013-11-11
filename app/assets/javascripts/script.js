var $scoll_position,
    $height,
    $button_aboutus;


function shiftOne() {
    $doc.animate({scrollTop: $height/3 });
}

function shiftTwo() {
    $doc.animate({scrollTop: $height });
}

$(function() {
  $doc = $('html, body');
  $height = $(document).height();
  $button_aboutus = $('#button-aboutus');
  $button_signup = $('#button-signup');

  $button_aboutus.on("click", shiftOne);
  $button_signup.on("click", shiftTwo);
});




////// Javier's code /////////
// function updateSize() { 
//   var windowW = $(window).width(); 
//   var windowH = $(window).height(); 
//   var windowAspect = windowW/windowH;

//   console.log(windowW);
//   console.log(windowH);
// }

// $(function() {
//   updateSize();
// });













