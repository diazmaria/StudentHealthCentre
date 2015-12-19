/*
	jQuery plugin for changing the image of an ImageButton on mouseover and mouseout
    https://github.com/diazmaria/jquerychangeimagebuttons
	Copyright (c) 2015 María Díaz (Licensed under Creative Commons BY-NC 4.0)
	Version 1.0
*/

/* ATENTION!!! Notice that you must replace the "btn-img" class that I have used as example
by the name of the class you have setted to your ImageButton */
$(document).ready(function() {
	$(".btn-img").mouseover(function () {
		var src = $(this).attr("src").replace(".png", "-hover.png");
		$(this).attr("src", src);
	})
	.mouseout(function () {
		var src = $(this).attr("src").replace("-hover", "");
		$(this).attr("src", src);
	})
})

//AJAX version. The pageLoad() method is called after every partial postback. 
function pageLoad() {
	$(".btn-img").mouseover(function () {
		var src = $(this).attr("src").replace(".png", "-hover.png");
		
		$(this).attr("src", src);
	})
	$(".btn-img").mouseout(function () {
		var src = $(this).attr("src").replace("-hover", "");
		$(this).attr("src", src);
	})
}