// Scroll.js

$(document).ready(function(){
	$('a[href^="#"]').on('click',function (e) {
	    e.preventDefault();

	    var target = this.hash,
	    $target = $(target);

	    $('html, body').stop().animate({
	        'scrollTop': $target.offset().top
	    }, 1000, 'swing', function () {
	        window.location.hash = target;
	    });
	});
});

$(window).resize(function(){
	// set sec with tabs minimal height
	AutoMinHeight();
});
	
// Open menu in desktop version

$('#OpenDesktopMenu, .desktop_menu_close').click(function(){
	var navigation_to_open = $('.desktop_menu').attr('data-open');
	if($('.desktop_menu').hasClass('opened')){
		$('.desktop_menu').removeClass('opened');
	}else{
		$('.desktop_menu').addClass('opened');
	}
	
});

// Close menu in desktop version{

$(document).click(function (e) {
    var menu = $(".desktop_menu");
	if (menu.has(e.target).length === 0 && e.target.id!='desktop_menu' && e.target.id!='OpenDesktopMenu'){
		$(menu).removeClass('opened');
    }
});

// Open menu in mobile version

$('.mobile_menu, .mobile_menu_close').click(function(){
	var navigation_to_open = $('.mobile_menu').attr('data-open');
	if($('.'+navigation_to_open).hasClass('opened')){
		$('.'+navigation_to_open).removeClass('opened');
		$('.mobile_menu').removeClass('opened');
	}else{
		$('.'+navigation_to_open).addClass('opened');
		$('.mobile_menu').addClass('opened');
	}
	
});

// Close menu in mobile version{

$(document).click(function (e) {
    var menu = $("nav");
	if (menu.has(e.target).length === 0 && e.target.id!='nav' && e.target.id!='mobile_menu'){
		$(menu).removeClass('opened');
		$('.mobile_menu').removeClass('opened');
    }
});

// play video in header 5 background


	var header5_start_height = 0;
	var video_container = '';

	$('.header5_play').click(function(){
		video_container = $(this).attr('data-container-id');
		header5_start_height = $('#'+video_container).outerHeight();
		var windowHeight=$(window).height();
		var windowWidth=$(window).width();
		$('#'+video_container).animate({height:windowHeight},300);
		$('#'+video_container+' .container, .nav5').fadeOut(300);
		$('#'+video_container+' .video').height(windowHeight).width(windowWidth).fadeIn(300);
		$('#'+video_container+' video').height(windowHeight).width(windowWidth).get(0).play();
		// check if device is mobile in portrait orientetion
		if(windowWidth<=windowHeight){
			var koeff = $('#'+video_container+' video').get(0).videoWidth/windowWidth;
			var height = $('#'+video_container+' video').get(0).videoHeight/koeff;
			$('#'+video_container).animate({height:height},300);
			$('#'+video_container+' .video').height(height).width(windowWidth).fadeIn(300);
			$('#'+video_container+' video').height(height).width(windowWidth).get(0).play();
		}
	});
	$('.header5_pause').click(function(){
		$('#'+video_container).animate({height:header5_start_height},300);
		$('#'+video_container+' .container, .nav5').fadeIn(300);
		$('#'+video_container+' .video').fadeOut(300);
		$('#'+video_container+' video').get(0).pause();
	});



// set sec with tabs minimal height

function AutoMinHeight(){
	if($('.AutoMinHeight').size()>0){
		var height = $('.AutoMinHeight').outerHeight();
		$('.AutoMinHeight').css('min-height',height);
	}
}

AutoMinHeight();


// header11 slider

if($('.header11_slider').size()>0){
	$('.header11_slider ul').bxSlider({controls:false, mode:'fade'});
}

// Function to add shadow to form, when user clicks to input inside it

function focusForm(formID,focused){
	if(focused){
		$('#'+formID).addClass('focused');
	}else{
		$('#'+formID).removeClass('focused');
	}
}
