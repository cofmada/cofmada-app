document.addEventListener('turbolinks:load', () => {
  //一括チェック用
  $('.all_check > input[type=checkbox]').on('change', function() {
    $('.all_check > input[type=checkbox]').not(this).prop('checked', false);
    if ($(this).prop('checked')) {
      $(this).nextAll('input[type=checkbox]').prop('checked', true);
    } else {
      $(this).nextAll('input[type=checkbox]').prop('checked', false);
    }
  });
});
