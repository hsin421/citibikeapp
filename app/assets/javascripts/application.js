// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery-ui/autocomplete

$(document).on('ready page:load', function() {

// $("#search").on("click", function() {
// 		$.ajax({
// 		type: 'GET',
// 		url: '/find',
// 		data: {cs1: " W 41 St", cs2: " 11 Ave"},
// 		success: function() {$("#search").css("background-color", "green")}
// 	    });
		
// 	});
	function hasClick(objId){
		this.objId = objId
		this.hasClick = false;	
	}

	var mobileMenu = new hasClick("#mobile-nav");

	$("#menu-icon").click(function(){
		if(mobileMenu.hasClick ==false){
			$("#mobile-nav").show();
				mobileMenu.hasClick = true;
		} else {
			$("#mobile-nav").hide();
				mobileMenu.hasClick = false;
		}
	});

})
