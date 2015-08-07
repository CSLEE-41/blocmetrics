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
//= require bootstrap
//= require_tree .

var blocmetrics = {};

blocmetrics.report = function(arg1){
  // eventually this function is going to send an AJAX request to the server
  // and it will store the event in the database  For now it is just logging to console.
  // This is a stub.


  // What contoller action do we need to send a request 
  //to in order to write a new event to the DB
  // /api/events POST


  var event = {event: {name: arg1 }};

  var request = new XMLHttpRequest();
  request.open("POST", "http://localhost:3000/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');

  request.onreadystatechange = function() {
    // #2
  };

  request.send(JSON.stringify(event));
};






// Event handling
// There are HTML elements that different events can happen to:
// load, clicked, hovered




$(document).ready(function(){



  $("#test").click(function(){
    blocmetrics.report("About Was Clicked")
  });

  $("#button-two").click(function(){
    blocmetrics.report("button-two was clicked")
  });


});