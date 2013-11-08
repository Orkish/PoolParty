function updateSize() { 
  var windowW = $(window).width(); 
  var windowH = $(window).height(); 
  var windowAspect = windowW/windowH;

  console.log(windowW);
  console.log(windowH);
}

$(function() {
  updateSize();
})