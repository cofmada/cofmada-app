document.addEventListener('turbolinks:load', () => {
  //開閉用
  $('.acord').on('click', function () {
    let parent = $(this).parent();
    $(parent).addClass('open');
    $('.open + .page').slideToggle();
    $(parent).removeClass('open');
  });
  
  //時計
  setInterval((function clock() {
    const d = new Date();
    const year = d.getFullYear();
    let month = d.getMonth() + 1;
    let date = d.getDate();
    const dayNum = d.getDay();
    const weekday = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    const day = weekday[dayNum];
    let hour = d.getHours();
    let min = d.getMinutes();
    month = month < 10 ? `0${month}` : month;
    date = date < 10 ? `0${date}` : date;
    hour = hour < 10 ? `0${hour}` : hour;
    min = min < 10 ? `0${min}` : min;
    const today = `${year}.${month}.${date} ${day}`;
    const time = `${hour}:${min}`;
    document.querySelector('.clock-date').innerText = today;
    document.querySelector('.clock-time').innerText = time;
    return clock;
  }()), 500);
  
  $('.1').on('change', function() {
    $('input[type=checkbox]').not('.1').prop('checked', false);
    if ($(this).prop('checked')) {
      $('.1').prop('checked', true);
    } else {
      $('.1').prop('checked', false);
    }
  });
  $('.2').on('change', function() {
    $('input[type=checkbox]').not('.2').prop('checked', false);
    if ($(this).prop('checked')) {
      $('.2').prop('checked', true);
    } else {
      $('.2').prop('checked', false);
    }
  });
  $('.3').on('change', function() {
    $('input[type=checkbox]').not('.3').prop('checked', false);
    if ($(this).prop('checked')) {
      $('.3').prop('checked', true);
    } else {
      $('.3').prop('checked', false);
    }
  });
  $('.4').on('change', function() {
    $('input[type=checkbox]').not('.4').prop('checked', false);
    if ($(this).prop('checked')) {
      $('.4').prop('checked', true);
    } else {
      $('.4').prop('checked', false);
    }
  });
  $('.5').on('change', function() {
    $('input[type=checkbox]').not('.5').prop('checked', false);
    if ($(this).prop('checked')) {
      $('.5').prop('checked', true);
    } else {
      $('.5').prop('checked', false);
    }
  });
})