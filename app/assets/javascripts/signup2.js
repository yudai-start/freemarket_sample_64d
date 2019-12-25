$(function(){
  $("#phone").on('submit', function(){
    var error = 0;
    var error_format = '<span class="error">フォーマットが不適切です</span>';
    var error_registered = '<span class="error">入力頂いた電話番号は登録済みです。</span>';
    var regex_phone    = new RegExp(/^[0-9]{10,11}$/);
    var phone = $("#phone_number").val();
    var phonelist = $("#phonelist").val();

    $(".error").remove()

    if(phone.match(regex_phone)){
      if(phonelist.includes(phone)){
        $(".signup2__contents__main__form1").after(error_registered);
        error++;
      }
    }else{
      $(".signup2__contents__main__form1").after(error_format);
      error++;
    }

    if (error){
      return false;
    }
  });

});