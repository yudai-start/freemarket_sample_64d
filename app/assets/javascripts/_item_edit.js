$(function(){
  //querySelectorでfile_fieldを取得
  // var file_field = document.querySelector('input[type=file]')
  //fileが選択された時に発火するイベント
    $('#item_images_attributes_0_image').change(function(){
      //選択したfileのオブジェクトをpropで取得
      var file = $('input[type="file"]').prop('files')[0];
      //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
      var fileReader = new FileReader();
      //読み込みが完了すると、srcにfileのURLを格納
      fileReader.onloadend = function() {
        var src = fileReader.result
        var html= `
                  <div class="formboxes-side">
                  <ul>
                  <li class="sell-upload-item">
                  <figure class="sell-upload-item-image">
                  <img class="sell-upload-item-image-img" src="${src}">
                  </figure>
                  <div class="sell-upload-item-buttons">
                  <a class="button" href="#">編集</a>
                  <a class="button" id="destoroy-btn" href="#">削除</a>
                  </div>
                  </li>
                  </ul>
                  </div>
                  `
        //image_box__container要素の前にhtmlを差し込む
        $('.formboxes').prepend(html);
      }
      fileReader.readAsDataURL(file);
    });
});

$(function() {
  
  $("#destoroy-btn").on('click',function(){                               //$("フォームのクラス名").on('イベント')
     

    $(".formboxes-side").remove()   
  });
});
