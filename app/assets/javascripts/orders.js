// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $(".remove-order").on("click", function(ev) {
    ev.preventDefault();
    ev.stopPropagation();
    $(this).closest("tr").remove();
    var url = $(this).attr("href");
    $.ajax({
      url: url,
      method: 'delete',
      dataType: 'json'
    }).done(function(response) {
      $(".alert-success").remove();
      $("#cart").prepend(response.text)
      $("#total").text('$' + response.sum)
    })

  })

})
