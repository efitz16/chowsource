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

  function showRating() {
    var length = $('.rating-button').length;

      for (var i = 0; i < length; i++) {
        if ($($('.rating-button')[i]).attr('id') <= $('#average').text().slice(-1)){
          $($('.rating-button')[i]).css({'background-color': 'yellow'});
          $($('.rating-button')[i]).addClass("stay");
        }
      }
  }

  function removeRating() {
    var length = $('.rating-button').length;

    for (var i = 0; i < length; i++) { 
      $($('.rating-button')[i]).css({'background-color': 'white'});
    }
  }

  showRating();

  $('.rating-button').on("mouseover", function(e){
        var button = $(e.target);
        var length = $('.rating-button').length;

        for (var i = 0; i < length; i++) {
          if ($($('.rating-button')[i]).attr('id') <= button.attr('id')) {
            $($('.rating-button')[i]).css({'background-color': 'yellow'});
          }
          else {
            $($('.rating-button')[i]).css({'background-color': 'white'});
          }
        }
    });

  $('.rating-button').on("mouseleave", function(e){
      removeRating();
      showRating();
  });

});

$(document).ready(function(){
  $(".add-ingredient").click(function(e) {
    e.preventDefault();
    $(e.target).toggle();
    $.ajax({
      url: $(e.target).attr("href"),
      method: "get"
    })
    .done(function(response) {
      $(e.target).parent().append($(response).find(".new_ingredient"));
    });
  });
  $(".new_ingredient_form").submit(function(e) {
    e.preventDefault();
    $.ajax({
      url: $(e.target).attr("action"),
      method: $(e.target).attr("method"),
      data: $("form").serialize()
    })
    .done(function(response) {
      $("ul").append($(response).find("li").last());
      $(".add-ingredient").toggle();
      $(".new_ingredient").remove();
    })
  })
});
