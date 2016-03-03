// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require masonry/jquery.masonry
//= require_tree .
$(document).ready(function() {
  	$('a[href^="#"]').on('click',function (e) {
  	    e.preventDefault();
  
  	    var target = this.hash;
  	    var $target = $(target);
  	    $('html, body').stop().animate({
  	        'scrollTop': $target.offset().top - 50
  	    }, 1000, 'swing', function () {
  	        window.location.hash = target; // add hash to the URL
  	    });
  	});
  	
    $("#btn-add-submit").click(function(){
      console.log("xxxxx")
      $("#add-result").text('Creating...');
      $("#project-aftersave").html('');
    });  	
    
});
