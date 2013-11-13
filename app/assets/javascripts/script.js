var $scoll_position,
    $height,
    $button_aboutus;


//----------SPLASH PAGE SCROLL---------------------//

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

//---------SPLASH PAGE VERTICAL CENTER---------------//

var $div_top,
    $div_mid,
    $div_bottom;

$(function(){
  $div_top = $('#splash-first');
  $div_mid = $('#splash-second');
  $div_bottom = $('#splash-third');

  var $div_top_content = $('#splash-home');
  var $div_mid_content = $('#splash-about');
  var $div_bottom_content = $('#splash-signup');

  var top_margin_top = ($div_top.height() - $div_top_content.height()) / 2;
  var top_margin_mid = ($div_mid.height() - $div_mid_content.height()) / 2;
  var top_margin_bottom = ($div_bottom.height() - $div_bottom_content.height()) / 2;
  
  $div_top_content.css('margin-top', top_margin_top + "px");
  $div_mid_content.css('margin-top', top_margin_mid + "px");
  $div_bottom_content.css('margin-top', top_margin_bottom + "px");

  $(window).resize(function(){

    var $div_top_content = $('#splash-home');
    var $div_mid_content = $('#splash-about');
    var $div_bottom_content = $('#splash-signup');

    var top_margin_top = ($div_top.height() - $div_top_content.height()) / 2;
    var top_margin_mid = ($div_mid.height() - $div_mid_content.height()) / 2;
    var top_margin_bottom = ($div_bottom.height() - $div_bottom_content.height()) / 2;
    
    $div_top_content.css('margin-top', top_margin_top + "px");
    $div_mid_content.css('margin-top', top_margin_mid + "px");
    $div_bottom_content.css('margin-top', top_margin_bottom + "px");

  });

})

//-----------AJAX CALLS FOR TRIP PAGE----------------//
var $trip_row,
    $trip_show,
    $request;

$(function(){
  $trip_row = $('.trips');
  $trip_show = $('#show-trip');

  $trip_row.on("click", function(){
    $.ajax({
      url: '/trip/' + $(this).data("trip_id"),
      method: 'GET',
      datatype: 'json'
    }).success(function(data){
      $trip_show.empty().append($("<div>Date: " + data.date + "<br>"
        + "Time: " + data.time + "<br>"
        + "Location: " + data.location + "<br>"
        + "Destination: " + data.destination + "<br>"
        + "Spaces: " + data.spaces + "<br></div>"

        ));
      // console.log(data);
    });
    // console.log($(this).attr("id"));
  });
})

$(function(){
  $request = $('.request');

  $request.on("click", function(e){
    // Stops the bubbling!!
    e.stopPropagation();
    console.log($(this).parent().data("user_id"));
    $.ajax({
      url: '/request/driver/' + $(this).parent().data("user_id"),
      method: 'GET'
    }).done(function(data){
      console.log($(this));
      console.log(data);
    });
  });
})

///////// date picker calendar ////////

// $(function() {
//   $( "#datepicker" ).datepicker();
//   $.datepicker.setDefaults( $.datepicker.regional[ "" ] );
// });

////////// trip form //////////////


var $side_menu,
    animation_duration;

function animateMenuIn() {
  $side_menu.stop().animate({
      right: '0px',
      opacity: 1
    },
    animation_duration,
    function() {
      $side_menu.addClass('active');
    }
  );
}
function animateMenuOut() {
  $side_menu.stop().animate({right: '-280px', opacity: 0.5}, animation_duration);
  $side_menu.removeClass('active');
}

$(function() {
  animation_duration = 500;
  $side_menu = $('#trip-form');

  $side_menu.on("mouseover", animateMenuIn);
  $side_menu.on("mouseout", animateMenuOut);

});



























