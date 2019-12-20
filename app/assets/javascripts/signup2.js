$(function(){
  $("#phone").on('submit', function(){
    var error = 0;
    var error_format = '<span class="error">フォーマットが不適切です</span>';

    let regex_phone    = new RegExp(/^[0-9]{10,12}$/);
    var phone = $("#phone_number").val();

    $(".error").remove()

    if(phone.match(regex_phone)){
    }else{
      $(".signup2__contents__main__form1").after(error_format);
      error++;
    }

    if (error){
      return false;
    }
  });

});