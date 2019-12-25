$(function(){
  Payjp.setPublicKey('pk_test_87914715ad4ff177a42aefd7'); //公開キーをセット 
  var form = $("#charge-form"),                           //signup4.html.hamlの各フォームを代入
      number = form.find('#card_number'),
      cvc = form.find("#cvc"),
      exp_month = form.find("#exp_month"),
      exp_year = form.find("#exp_year");
  $("#charge-form").submit(function(e) {                   //signup4.html.hamlでsubmitボタンが押されたら発火
    e.preventDefault();
    form.find("#token-submit").prop("disabled", true);
    
    var card = {                                    //各フォームの値から、カード情報を取得。
        number: number.val(),
        cvc: cvc.val(),
        exp_month: exp_month.val(),
        exp_year: exp_year.val()
    };
    Payjp.createToken(card, function(s, response) { //カード情報からトークン生成
      if (response.error) {
        form.find('.payment-errors').text(response.error.message);
        form.find('#token-submit').prop('disabled', false);
        alert("入力の正しくない箇所があります");
      }
      else {
        $(".signup4__contents__main__form1__form").removeAttr("name");  //トークンが生成されたら、フォームから値を削除。※カード情報をサーバーサイドへ送ってはならない！
        $(".signup4__contents__main__form3__form").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");
        
        var token = response.id;  //トークンを代入
        form.append($('<input type="hidden", action="/signup/signup5", method="post"  name="payjpToken" />').val(token));
        form.get(0).submit();   //トークンを送信。 paramsとしてcreateアクションへ飛ぶ。
      }
    });
  });
});