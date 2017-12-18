$(document).on('turbolinks:load',function(){

  var $bg_blue = $('.lp-navbar');
  var scroll_blue = 200;

  $(window).scroll(function() {
		var scroll_current = $(this).scrollTop();
		if (scroll_current < scroll_blue) {
				$bg_blue.stop().removeClass("lp-navbar-brand");
		} else if (scroll_current > scroll_blue) {
				$bg_blue.stop().addClass("lp-navbar-brand");
		}
  });
    
});//jQuery