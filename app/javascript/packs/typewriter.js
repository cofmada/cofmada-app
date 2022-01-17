document.addEventListener('turbolinks:load', () => {
  const txt1 = `好きなチャンネルや動画の情報を登録することで、自分だけの番組表を作成できます。アーカイブ消化や視聴スケジュール表としてご活用下さい。`;
  const txt2 = `Ch名とChのURLを登録できます。まずはこちらで登録をして下さい。`;
  const txt3 = `登録したChの一覧が確認できます。一覧にある各Ch名をクリックし、動画の登録を行って下さい。また、動画数をクリックすると動画の一覧を確認できます。`;
  const txt4 = `登録したCh情報と動画情報を元に、番組表の作成・登録ができます。`;
  const txt5 = `番組表の一覧が確認でき、表の編集ができます。`;

  //タイプライター風表示
  const showText = (selector) => {
    let i = 0;
    $.when(
      $('.writer > p').removeClass('selected'),
      $('.writer').css('pointer-events', 'none'),
      $('.txt').html('<p id="type" class="pt-2"></p>')
    ).done(function typeWriter() {
      if (i < selector.length) {
        document.getElementById('type').innerHTML += selector.charAt(i);
        i++;
        setTimeout(typeWriter, 40);
        if (i == selector.length) {
          $('.writer').css('pointer-events', '');
        }
      }
    });
  };

  $('.ev1').on('click', function() {
    showText(txt1);
    $(this).addClass('selected');
  });
  $('.ev2').on('click', function() {
    showText(txt2);
    $(this).addClass('selected');
  });
  $('.ev3').on('click', function() {
    showText(txt3);
    $(this).addClass('selected');
  });
  $('.ev4').on('click', function() {
    showText(txt4);
    $(this).addClass('selected');
  });
  $('.ev5').on('click', function() {
    showText(txt5);
    $(this).addClass('selected');
  });
});
