$(function(){
  $("#signin").on('submit', function(){
    var error = 0;
    var error_recaptcha = '<span class="error">チェックが必要です</span>';

    var response = grecaptcha.getResponse();

    $(".error").remove()

    if(response.length == 0){
      $(".recaptcha").after(error_recaptcha);
      error++;
    }

    if (error){
      return false;
    }
    debugger
  });
});