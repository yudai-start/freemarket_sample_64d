$(function(){
  $("#address").on('submit', function(){
    var error = 0;
    var error_message = '<span class="error">必須項目です</span>';

    $(".error").remove()

    if($("#family_name").val()=="" || $("#first_name").val()==""){
      $(".name").after(error_message);
      error++;
    }
    if($("#family_name_kana").val()=="" || $("#first_name_kana").val()==""){
      $(".name_kana").after(error_message);
      error++;
    }
    if($("#post_code").val()==""){
      $(".post_code").after(error_message);
      error++;
    }
    if($("#city").val()==""){
      $(".city").after(error_message);
      error++;
    }

    if($("#street_number").val()==""){
      $(".street_number").after(error_message);
      error++;
    }

    if (error){
      return false;
    }

    delete g-recaptcha-response
  });

});