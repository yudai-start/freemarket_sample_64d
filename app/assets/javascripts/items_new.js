$(function(){
  $('#input').on('input', function(){   //リアルタイムで表示したいのでinputを使う｡入力の度にイベントが発火するようになる｡
    var data = $('#input').val(); // val()でフォームのvalueを取得(数値)
    var profit = Math.round(data * 0.9)  // 手数料計算を行う｡dataにかけているのが0.9なのは単に引きたい手数料が10%のため｡
    var fee = (data - profit) // 入力した数値から計算結果(profit)を引く｡それが手数料となる｡
    $('.ex-pbright1').html(fee) //  手数料の表示｡html()は追加ではなく､上書き｡入力値が変わる度に表示も変わるようにする｡
    $('.ex-pbright1').prepend('¥') // 手数料の前に¥マークを付けたいので
    $('.ex-pbright2').html(profit)
    $('.ex-pbright2').prepend('¥')
    $('#price').val(profit) // 計算結果を格納用フォームに追加｡もし､入力値を追加したいのなら､今回はdataを引数に持たせる｡
    if(profit == '') {   // もし､計算結果が''なら表示も消す｡
    $('.ex-pbright2').html('');
    $('.ex-pbright1').html('');
    }
  })



  
})

// $('select.js').on('blur', function() {
//   var error; // エラー用の変数を定義
//   if( $(this).val() === '' ) { // この要素のvalueが空文字だったらエラー
//       error = true;
//   }
//   if( error ) {
//       // エラーが見つかった場合
// if( !$(this).next('span.error').length ) { // この要素の後続要素が存在しない場合
//                $(this).after('<span class="error">未入力です</span>'); // この要素の後にエラーメッセージを挿入
// }
//   } else {
//       // エラーがなかった場合
//       $(this).next('span.error').remove(); // この要素の後続要素を削除
//   }
// });

// $(function()
// {
//   //バリデーション
//   $('input.js').on('blur',function()
//   {
//     let error;
//     let value = $(this).val();
//     if(value == "")
//     {
//       error = true;
//     }
//     else if(!value.match(/[^\s\t]/))
//     {
//       error = true;
//     }

//     if(error)
//     {
//       //エラー時の処理
//     }
//   });
// });





// $('input.js').on('blur', function() {
//   var error; // エラー用の変数を定義
//   if( $(this).val() === '' ) { // この要素のvalueが空文字だったらエラー
//       error = true;
//   }
//   if( error ) {
//       // エラーが見つかった場合
// if( !$(this).next('span.error').length ) { // この要素の後続要素が存在しない場合
//                $(this).after('<span class="error">未入力です</span>'); // この要素の後にエラーメッセージを挿入
// }
//   } else {
//       // エラーがなかった場合
//       $(this).next('span.error').remove(); // この要素の後続要素を削除
//   }
// });


// if (!isset($_FILES['image']['error']) || !is_int($_FILES['image']['error'])){
//   echo "ファイルアップロードエラー";
// } else {
//   $file_name = $_FILES['image']['name'];
//   $extension = pathinfo($file_name, PATHINFO_EXTENSION); //拡張子取得
//   $tmp_path = $_FILES['image']['tmp_name'];
//   $file_dir_path = "upload/";
//   $uniq_name = date("YmdHis").md5(uniqid(microtime(),1)).session_id() . "." . $extension;

//   if (is_uploaded_file($tmp_path)) {
//     if(move_uploaded_file( $tmp_path, $file_dir_path . $uniq_name)) {
//       chmod($file_dir_path . $uniq_name, 0644);
//     } else {
//       echo "Error:アップロードできませんでした。";
//     }
//   }
// }




// var fileArea = document.getElementById('ex-img-form');
// var fileInput = document.getElementById('image');


// fileArea.addEventListener('dragover', function(evt){
//   evt.preventDefault();
//   fileArea.classList.add('dragover');
// });

// fileArea.addEventListener('dragleave', function(evt){
//     evt.preventDefault();
//     fileArea.classList.remove('dragover');
// });
// fileArea.addEventListener('drop', function(evt){
//     evt.preventDefault();
//     fileArea.classList.remove('dragenter');
//     var files = evt.dataTransfer.files;
//     fileInput.files = files;
// });


// function handleFileSelect(evt) {
//   evt.stopPropagation();
//   evt.preventDefault();

//   files = evt.dataTransfer.files; // FileList object.

//   // 以下に必要なFile Objectのプロパティを記述
//   var output = [];
//   for (var i = 0, f; f = files[i]; i++) {
//     output.push('<li><strong>', escape(f.name), '</strong> (', f.type || 'n/a', ') - ',
//                 f.size, ' bytes, last modified: ',
//                 f.lastModifiedDate.toLocaleDateString(), '</li>');
//   }
//   document.getElementById('list').innerHTML = '<ul>' + output.join('') + '</ul>';
// }

// function handleDragOver(evt) {
//   evt.stopPropagation();
//   evt.preventDefault();
//   evt.dataTransfer.dropEffect = 'copy'; 
// }

// // イベントリスナーを設定
// var dropZone = document.getElementById('ex-img-form');
// dropZone.addEventListener('dragover', handleDragOver, false);
// dropZone.addEventListener('drop', handleFileSelect, false);




// function file_upload()
// {
//     // フォームデータを取得
//     let formdata = () => new FormData($('#item_images_attributes_0_image).get(0));
//     // ファイルが未登録なら一番最初のファイルを追加
//     // 複数ファイルアップロードの場合ここを修正
//     if($('input[name="upload_file"]').val() == ""){
//       formdata.append('upload_file',files[0])
//     }

//     //非同期通信
//     $.ajax({
//         url  : "/upload",
//         type : "POST",
//         data : formdata,
//         cache       : false,
//         contentType : false,
//         processData : false,
//         dataType: 'html',

//     })
//     .done(function(data, textStatus, jqXHR){
//         console.log(data);
// //     })
// //     .fail(function(jqXHR, textStatus, errorThrown){
//         console.log("fail");
//     })
//     .always(function(data){
//         console.log("complete")
//     });
// }


// function buildImage(loadedImageUri){
//   var html =
//   `<li>
//     <img src=${loadedImageUri}>
//     <div class="ex-img-form__box">
//       <div class="ex-img-form__box__edit" >
//         編集
//       </div>
//       <div>
//         <a class="ex-img-form_box__delete">削除</a>
//       </div>
//     </div>
//   </li>`
//   return html
// };
// // 画像を管理するための配列を定義する。
// var files_array = [];
// // 通常のドラッグオーバイベントを止める。
// $('.ex-img-form ').on('dragover',function(e){
//     e.preventDefault();
// });
// // ドロップ時のイベントの作成
// $('.ex-img-form ').on('drop',function(event){
//   event.preventDefault();
//     // 何故か、dataTransferがうまくいかなかったので、originalEventから読み込んでいます。
//     // ここで、イベントによって得たファイルを配列で取り込んでいます。
//   files = event.originalEvent.dataTransfer.files;
//     // 画像のファイルを一つづつ、先ほどの画像管理用の配列に追加する。
//   for (var i=0; i<files.length; i++) {
//     files_array.push(files[i]);
//     var fileReader = new FileReader();
//     // ファイルが読み込まれた際に、行う動作を定義する。
//     fileReader.onload = function( event ) {
//     // 画像のurlを取得します。
//     var loadedImageUri = event.target.result;
//     // 取得したURLを利用して、ビューにHTMLを挿入する。
//     $(buildImage(loadedImageUri,)).appendTo(".item__images__container__preview ul").trigger("create");
//     };
//     // ファイルの読み込みを行う。
//     fileReader.readAsDataURL(files[i]);
//   }
// });

// $(document).on('click','.item__images__container__preview a', function(){
//   // index関数を利用して、クリックされたaタグが、div内で何番目のものか特定する。
//   var index = $(".item__images__container__preview a").index(this);
//   // クリックされたaタグの順番から、削除すべき画像を特定し、配列から削除する。
//   files_array.splice(index - 1, 1);
//   // クリックされたaタグが含まれるli要素をHTMLから削除する。
//   $(this).parent().parent().parent().remove();
// });

// // submitボタンが押された際のイベント
// $('#new_item').on('submit', function(e){
//   e.preventDefault();
//   // そのほかのform情報を以下の記述でformDataに追加
//   var formData = new FormData($(this).get(0));
//   // ドラッグアンドドロップで、取得したファイルをformDataに入れる。
//   files_array.forEach(function(file){
//    formData.append("image[images][]" , file)
//   });
//   $.ajax({
//     url:         '/items/new',
//     type:        "POST",
//     data:        formData,
//     contentType: false,
//     processData: false,
//     dataType:   'json',
//   })
//   .done(function(data){
//     alert('出品に成功しました！');
//   })
//   .fail(function(XMLHttpRequest, textStatus, errorThrown){
//     alert('出品に失敗しました！');
//   });
// });

$(function() {

  function setErrorMessage(selector, string) {
    $(selector).next('.error-message').text(string).removeClass('.error_message');
  }
  $("form.item_new_form").on('submit',function(){
      var error = 0;
      var error_message = '<div><span class="error">必須項目です</span></div>';       //フォームが空のときに差し込まれるエラーメッセージ
      var error_num = '<span class="error">半角数字のみです</span>';


    $(".error").remove()    //エラーが出ている状態でボタンを押した時にエラーが何度も表示されないように一度削除

      if($("#item_images_attributes_0_image").val()==""){     //フォームの値がからとときの条件式
        $('.label').after(error_message);                     //指定したクラスの後に要素を差し込む
      }
      if($("#item_name").val()==""){
        $('#item_name').after(error_message);  
      }
      
      if($("#item_name").val()==""){
          // removeClass('.error_message')
          // $('#item_name').after(error_message);   
          
          error++;
          setErrorMessage('#item_name', error_message);   
      }
    //   if($("#item_name").val()==""){
    //     // removeClass('.error_message')
    //     // $('#item_name').after(error_message);   
        
    //     error++;
    //     setErrorMessage('#item_name', error_message);   
    // }
    //   if ($(".vali_name").val() == "") {
    //     error++;
    //     setErrorMessage('.vali_name', error_message);
    // }

    // if (error) {
    //     return false;
    // }
    //   // 年齢
      if($("#item_description").val()==""){
          $('#item_description').after(error_message);  
      }
    //   }else if(!$("#item_description").val()==""){
    //       $('#item_description').after(error_num);  
    //   }

    //   // 都道府県
      if($("#item_item_status").val()==""){
          $('#item_item_status').after(error_message);
      }
      if($("#item_shipping_fee_defrayer").val()==""){
        $('#item_shipping_fee_defrayer').after(error_message);
      }
      if($("#item_ship_from_prefecture").val()==""){
        $('#item_ship_from_prefecture').after(error_message);
      }
      if($("#item_ship_date").val()==""){
        $('#item_ship_date').after(error_message);
      }
      if($("#input").val()==""){
        $('#for-error-message').before(error_message);
      }else if(!$("#input").val().match(/^\d+$/)){
        $('#for-error-message').before(error_num);
      }
        
      
    //   if($(".vali_age").val()==""){
    //     $('.vali_age').after(error_message);  
    // }else if(!$(".vali_age").val().match(/^\d+$/)){
    //     $('.vali_age').after(error_num);  
    // }


    //   if($("#item_item_status").val()==""){
    //     $('#item_item_status').after(error_message);
    // }
    //   }

    //   // 評価の理由
    //   if($(".vali_comment").val()==""){
    //       $('.vali_comment').after(error_message);

    //   }

    if (error) {
      alert("未入力の箇所があります");
      return false;
  }

  });


});