$(function() {
    $('.item_search').on('submit', function(e) {
      e.preventDefault();
      // var formData = new FormData(".search-main__contensts__left__said-bar__word__search");
      var input = $(".search-main__contensts__left__said-bar__word__search").val();
      console.log(input)
      // var input = $('.item_search').val();
      var url = $(this).attr('action')
      $.ajax({
        url: url,
        type: "GET",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data) {
        console.log(data);
    })
  });
});