$(function(){

  $('.mypage-info-link').on("click", function() {
    $('.active').removeClass("active");
    $('.show').removeClass("show");
    
    const index = $('.mypage-info-link').index(this);
    $('.mypage-info-link').eq(index).addClass("active");
    $('.mypage-info__notify__ul').eq(index).addClass("show");
  });

  $('.mypage-history-link').on("click", function() {
    $('.is-active').removeClass("is-active");
    $('.is-show').removeClass("is-show");

    const index = $('.mypage-history-link').index(this);
    $('.mypage-history-link').eq(index).addClass("is-active");
    $('.icon').eq(index).addClass("is-show");
    $(document).off('scroll');
  });

  $('#destroy-click').on('click', function() {
    $('.destroy-confirmation').show();
    
  })

});