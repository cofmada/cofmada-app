document.addEventListener('turbolinks:load', () => {
  //開閉用
  $('.ac-p').on('click', function () {
    $('ul1').slideToggle();
    $(this).toggleClass("open");
    $('.ac-p').not(this).removeClass('open');
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
})