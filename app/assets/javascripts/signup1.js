$(function(){
  $("#name").on('submit', function(){
    var error = 0;
    var error_message = '<span class="error">必須項目です</span>';
    var error_format = '<span class="error">フォーマットが不適切です</span>';
    var error_pass = '<span class="error">フォーマットが不適切です</span>';

    var regex_email = new RegExp(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i);
    var regex_password = new RegExp(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,}/i);
    var email = $("#email").val()
    var password = $("#password").val()

    $(".error").remove()

    if($("#nickname").val()==""){
      $(".post-singnup1-nickname").after(error_message);
      error++;
    }

    if($("#email").val().match(regex_email) == false){
      $(".post-singnup1-email").after(error_format);
      error++;
    }

    if($("#password").val().match(regex_password) == false){
      $(".post-singnup1-password").after(error_format);
      error++;
    }

    if($("#family_name").val()=="" || $("#first_name").val()==""){
      $(".post-singnup1-name-kanji").after(error_message);
      error++;
    }

    if($("#family_name_kana").val()=="" || $("#first_name_kana").val()==""){
      $(".post-singnup1-name-kana").after(error_message);
      error++;
    }

    if (error){
      return false;
    }
  });

});