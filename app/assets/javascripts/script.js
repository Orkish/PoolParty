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

///////////////// AJAX CALLS //////////////////
var $trip_row,
    $trip_show;

function appendData(trip){
  $trip_show.text("Date: " + trip.date);
};

$(function(){
  $trip_row = $('.trips');
  $trip_show = $('#show-trip');

  $trip_row.on("click", function(){
    $.ajax({
      url: '/' + $(this).attr("id"),
      method: 'GET',
      datatype: 'json'
    }).success(function(data){
      $trip_show.empty().append($("<div>Date: " + data.date + "<br>"
        + "Time: " + data.time + "<br>"
        + "Location: " + data.location + "<br>"
        + "Destination: " + data.destination + "<br>"
        + "Spaces: " + data.spaces + "<br></div>"

        ));
      console.log(data);
    });
    console.log($(this).attr("id"));
  });
})