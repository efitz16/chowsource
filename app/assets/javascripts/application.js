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
//= require_tree


$(document).ready(function(){
  $('.dropdown-toggle').dropdown();
})

$(document).ready(function(){

  var length = $('.rating-button').length;

    for (var i = 0; i < length; i++) {
      if ($($('.rating-button')[i]).attr('id') <= $('#average').text().slice(-1)){
        $($('.rating-button')[i]).css({'background-color': 'yellow'});
        $($('.rating-button')[i]).addClass("stay");
      }
    }

    // var mousedover = [];

    // $('.rating-button').on("mouseover", function(e){
    //   mousedover.push($(e.target).attr('id'));
    // });

    $('.rating-button').on("mouseover", function(e){
      // if ($(e.target).attr('id') <= ) {
        var button = $(e.target);
        for (var i = 0; i < length; i++) {
          if ($($('.rating-button')[i]).attr('id') <= button.attr('id')) {
            $($('.rating-button')[i]).css({'background-color': 'yellow'});
          }
        }
      // $(e.target).css({'background-color': 'yellow'});
      });
    $('.rating-button').on("mouseleave", function(e){
      var button = $(e.target);
      for (var i = 0; i < length; i++) {
        if ($($('.rating-button')[i]).attr('id') > $('#average').text().slice(-1)) {
          $($('.rating-button')[i]).css({'background-color': 'white'});
        }

      }


      // if (!($(e.target).hasClass("stay"))) {
      //     if ($(e.target).attr('id') > $('#average').text().slice(-1)){
      //       $(e.target).css({'background-color': 'white'});
      //     }
      // }
      });
})


// $(document).ready(function(){
//   $('.dropdown-toggle').dropdown();

// })

