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

//----------- TRIP DELETE BUTTON --------------------//

var $del_trip;
var item;

$(function(){
  $del_trip = $(".delete");

  $del_trip.on("click", function(){
    item = $(this);
    $.ajax({
      url: "/profile/delete",
      data: { trip: $(this).data("trip_id") },
      type: "POST"
    }).success(function(data){
      item.parent().remove();
    });
  });

});



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
      $trip_show.empty().append($("<h2> Additional Trip Info</h2>"
        + "<table><tr><td><strong>Driver:</strong></td>" + "<td>" + data.driver + "</td></tr>"
        + "<tr><td><strong>Date:</strong></td>" + "<td>" + data.date + "</td></tr>"
        + "<tr><td><strong>Time:</strong></td>" + "<td>" + data.time + "</td></tr>"
        + "<tr><td><strong>Location:</strong></td>" + "<td>" + data.location + "</td></tr>"
        + "<tr><td><strong>Destination:</strong></td>" + "<td>" + data.destination + "</td></tr>"
        + "<tr><td><strong>Spaces:</strong></td>" + "<td>" + data.spaces + "</td></tr></table>"
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
      // console.log($(this));
      // console.log(data);
    });
  });
});

//--------------- trip form ----------------//

//reloads this part of code when page refreshes!
// document.addEventListener("page:change", function(){

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

  setTimeout(animateMenuIn, 500);
  setTimeout(animateMenuOut, 2000);

  // $(document).on('mouseover', '#trip-form', animateMenuIn);
  // $(document).on('mouseout', '#trip-form', animateMenuOut)

});

// });


/////////// trips page /////////////
$(function() {
  $(".trips").click(function(e) {
    e.stopPropagation();
    $("#show-trip").show( "slow" );
  });
  $("html").click(function() {
    $("#show-trip").hide( 1500 );
  });
});

//------------ edit profile ---------------//

// $(function() {
//   $("#edit-link").click(function(e) {
//     e.stopPropagation();
//     $("#edit-form").show( "slow" );
//   });
//   $("#profile-container").click(function(){
//     $("#edit-form").hide( "slow" );
//   });
// });

$(function() {
  var doc_height = $(document).height();
  var doc_width = $(document).width();

  $('.modal').on('click', function(){  
    var modal_id = $(this).attr('id').replace("-link","");  
    console.log(modal_id);
    show_modal(modal_id);
  });

  $('.close_modal').on('click', function(){  
    close_modal();  
  });  

  function close_modal(){  
    $('#mask').stop().fadeOut(500);  
    $('.modal-window').stop().fadeOut(500);  
  }  

  function show_modal(modal_id){
    var $element = $('#'+modal_id);

    $('#mask').stop().fadeOut(0);  
    $('.modal-window').stop().fadeOut(0);
    $('#mask').css({"opacity": 0, "height": doc_height });  
    $('#mask').stop().fadeTo(500,0.8);
    $element.stop().fadeIn(500);
    $element.css({"left": (doc_width - $element.width())/2 });
    $element.css({"top": (doc_height - $element.height())/2 });
  }  
});