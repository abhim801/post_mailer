// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'core-js/stable'
import 'regenerator-runtime/runtime'

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

$(document).ready(function(){
  $("#date").on('change', function(){
    $('.alert-message').css('display', 'none');
    $('.send-btn').attr("disabled", true);
    var date = $(this).val();
    $.ajax({
      method: "GET",
      url: "/search_posts",
      data: {
        date: date
      },
      success: function(data){
        $('alert-message').text('');
        if(data["status"] == "ok"){
          $('.alert-message').text('Total number post found for this ' +date+ ' is ' +data["data"].length);
          $('.alert-message').css('display', 'block');
          $('.send-btn').attr("disabled", false);
        }else{
          $('.alert-message').text('No post found to mail for this date '+date);
          $('.alert-message').css('display', 'block');
          $('.send-btn').attr("disabled", true);
        }
      }
    });
  });
});
