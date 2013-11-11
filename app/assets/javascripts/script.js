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

///////// date picker calendar ////////

$(function() {
  $( "#datepicker" ).datepicker();
  $.datepicker.setDefaults( $.datepicker.regional[ "" ] );
});












