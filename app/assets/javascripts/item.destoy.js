$(function() {
  $('#destroy-click').on('click', function() {
    $('.destroy-confirmation').fadeIn();
  });

  $('.destroy-confirmation__choice__cancel').on("click", function() {
    $('.destroy-confirmation').fadeOut();
  });
});