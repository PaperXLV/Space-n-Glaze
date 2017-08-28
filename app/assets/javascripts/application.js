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
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

/* global $ */


$(document).on('turbolinks:load', function(){
    var fades = $('.fade-in');
    var navfoot = $('.navbar-bottom');
    
    
    $(window).scroll( function() {
        fades.each(function(i) {
            var bottomob = $(this).position().top + $(this).outerHeight();
            var bottomwind = $(window).scrollTop() + $(window).height();
            
            if (bottomwind > bottomob) {
                $(this).delay(1500).addClass('fade-in-effect');
                $(this).removeClass('fade-in');
            }
        });
    });
    
    var body = document.body,
    html = document.documentElement;

    var height = Math.max( body.scrollHeight, body.offsetHeight, 
                       html.clientHeight, html.scrollHeight, html.offsetHeight );
    

    
});