$(function(){

 

  $('.exhibiting-link').on("click", function() {
    $('.ing-active').removeClass("ing-active");
    $('.exhibiting-show').removeClass("exhibiting-show");

    const index = $('.exhibiting-link').index(this);
    $('.exhibiting-link').eq(index).addClass("ing-active");
    $('.tab').eq(index).addClass("exhibiting-show");
    $(document).off('scroll');
  });

});