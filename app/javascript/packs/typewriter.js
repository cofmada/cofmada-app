document.addEventListener('turbolinks:load', () => {
  const txt1 = `好きなチャンネルの情報を登録し、自分だけのオリジナル番組表を作るサービスです。`;
  const txt2 = `放送している媒体を選択し、Ch情報を登録できます。`;
  const txt3 = `登録したChの一覧が確認でき、情報の編集や削除が行えます。`;
  const txt4 = `登録したCh情報を元に番組表の作成・登録ができます。`;
  const txt5 = `番組表の一覧が確認でき、表の編集や削除が行えます。`;

  //タイプライター風表示
  const showText = (selector) => {
    let i = 0;
    $.when(
      $('div1 > p').removeClass('selected'),
      $('div1').css('pointer-events', 'none'),
      $('div2').html('<p1 id="type" class="pt-2"></p1>')
    ).done(function typeWriter() {
      if (i < selector.length) {
        document.getElementById('type').innerHTML += selector.charAt(i);
        i++;
        setTimeout(typeWriter, 30);
        if (i == selector.length) {
          $('div1').css('pointer-events', '');
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
