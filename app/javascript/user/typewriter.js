document.addEventListener('turbolinks:load', () => {
  const txt1 = `好きなチャンネルや動画の情報を登録することで、自分だけの番組表を作成できます。アーカイブ消化や視聴スケジュール表としてご活用下さい。`;
  const txt2 = `Ch名とChのURLを登録できます。まずはこちらで登録をして下さい。`;
  const txt3 = `登録したChの一覧が確認できます。各Ch名をクリックで動画の登録、動画数をクリックでChの動画一覧を確認できます。`;
  const txt4 = `登録したCh情報と動画情報を元に、番組表の作成・登録ができます。名前と放送日を入力し、動画の開始時間を登録して下さい。`;
  const txt5 = `番組表の一覧が確認できます。名前をクリックすると詳細が表示され、編集することができます。`;

  //タイプライター風表示
  const showText = (selector) => {
    let i = 0;
    $.when(
      $('.writer > p').removeClass('selected'),
      $('.writer').css('pointer-events', 'none'),
      $('.txt').html('<p id="type" class="pt-2"></p><p id="type2" class="pt-2"></p>')
    ).done(function typeWriter() {
      let first = selector.indexOf('。')+1;
      if (i < first) {
        document.getElementById('type').innerHTML += selector.charAt(i);
        i++;
        setTimeout(typeWriter, 40);
      }  
      if (i >= first && i < selector.length) {
        document.getElementById('type2').innerHTML += selector.charAt(i);
        i++;
        setTimeout(typeWriter, 70);
      }  
      if (i == selector.length) {
        $('.writer').css('pointer-events', '');
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
