$(document).on('turbolinks:load', function(){
    $('.message .close').on('click', function() {
        console.log("dong")
      $(this).closest('.message').transition('fade');
    });
    $(".message .close").delay(3000).slideUp(200, function() {
        console.log("tu tu")
        $(this).closest('.message').transition('fade');
    });
})
