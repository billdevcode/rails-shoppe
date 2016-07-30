// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

  $(".new_order").on("submit", function(ev) {
    ev.preventDefault();
    var data = $(this).serialize();
    var url = $(this).attr("action")
    // console.log(data);

    $.ajax({
      url: url,
      method: 'POST',
      data: data,
      dataType: 'text'
    }).done(function(response) {
      $("#top").append(response)
      $("#bottom").append(response)
    })

  })

})
