// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap
//= require_tree .


function isTouchDevice(){
    return typeof window.ontouchstart !== 'undefined';
}

jQuery(document).ready(function(){
    /* If mobile browser, prevent click on parent nav item from redirecting to URL */
    if(isTouchDevice()) {
        // 1st click, add "clicked" class, preventing the location change. 2nd click will go through.
        jQuery("#nav-menu > li > a").click(function(event) {
            // Perform a reset - Remove the "clicked" class on all other menu items
            jQuery("#nav-menu > li > a").not(this).removeClass("clicked");
            jQuery(this).toggleClass("clicked");
            if (jQuery(this).hasClass("clicked")) {
                event.preventDefault();
            }
        });
    }
});