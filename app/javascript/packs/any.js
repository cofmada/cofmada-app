document.addEventListener('turbolinks:load', () => {
  $('.ac-p').on('click', function () {
    $(this).next().slideToggle();
    //openクラスをつける
    $(this).toggleClass("open");
    //クリックされていないac-parentのopenクラスを取る
    $('.ac-p').not(this).removeClass('open');
  });
  const clock = () => {
    const d = new Date();
    const year = d.getFullYear();
    let month = d.getMonth() + 1;
    let date = d.getDate();
    const dayNum = d.getDay();
    const weekday = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    const day = weekday[dayNum];
    let hour = d.getHours();
    let min = d.getMinutes();
    let sec = d.getSeconds();
    month = month < 10 ? `0${month}` : month;
    date = date < 10 ? `0${date}` : date;
    hour = hour < 10 ? `0${hour}` : hour;
    min = min < 10 ? `0${min}` : min;
    sec = sec < 10 ? `0${sec}` : sec;
    const today = `${year}.${month}.${date} ${day}`;
    const time = `${hour}:${min}:${sec}`;
    document.querySelector('.clock-date').innerText = today;
    document.querySelector('.clock-time').innerText = time;
  };
  setInterval(clock, 1000);
})