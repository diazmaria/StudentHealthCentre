/*
	jQuery and Bootstrap Custom Validation
    https://github.com/diazmaria/jquerycustomvalidation
	Copyright (c) 2015 María Díaz (Licensed under CC BY-NC 4.0)
	Version 1.0
*/

function validationOnFocus(event){
	var divID = "#" + event.target.id + "_div";
	var iconID = "#" + event.target.id + "_icon";
	var messageID = "#" + event.target.id + "_message";

	if ($(divID).hasClass("has-error")){
		$(divID).removeClass("has-error");
		$(iconID).removeClass("glyphicon-remove");
		$(messageID).removeClass("message");
	}  
}

function validationOnBlur(event){
	var divID = "#" + event.target.id + "_div";
	var iconID = "#" + event.target.id + "_icon";
	var messageID = "#" + event.target.id + "_message";
	var regexp;
    
	/* ATENTION!!! Notice that you must replace here the ids and the validation expressions I used as example 
	by the id of your TextBoxes or part of their value. The indexOf() method returns the position of the first occurrence 
	of a specified value in a string.
	*/
	if (event.target.id.indexOf("nhs") > -1)
		regexp = new RegExp("^[0-9]{3}-[0-9]{3}-[0-9]{4}$");
	else if (event.target.id.indexOf("birth") > -1)
		regexp = new RegExp("^\\b(0?[1-9]|[12][0-9]|3[01])\\s[/]\\s(0?[1-9]|1[012])\\s[/]\\s(19|20)?[0-9]{2}\\b$");
	else if (event.target.id.indexOf("txt") > -1)
		regexp = new RegExp("^(?!.*?\s{2})[A-Za-z0-9\- \/,:]{1,30}$");
	else if (event.target.id.indexOf("TextBox") > -1)
		regexp = new RegExp("^(?!.*?\s{2})[A-Za-z0-9\- \/,:]{1,30}$");
	
	if (regexp.test(event.target.value) == false){
		$(divID).addClass("has-error");
		$(iconID).addClass("glyphicon-remove");
		$(messageID).addClass("message");
	}
	else {
		if ($(divID).hasClass("has-error")){
			$(divID).removeClass("has-error");
			$(iconID).removeClass("glyphicon-remove");
			$(messageID).removeClass("message");
		}
	}  
}