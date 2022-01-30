document.addEventListener('turbolinks:load', () => {

  //開閉用
  $('.acord').on('click', function() {
    let parent = $(this).parent();
    $(parent).addClass('open');
    $('.open + .page').slideToggle();
    $(parent).removeClass('open');
  });

  //時計
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
    month = month < 10 ? `0${month}` : month;
    date = date < 10 ? `0${date}` : date;
    hour = hour < 10 ? `0${hour}` : hour;
    min = min < 10 ? `0${min}` : min;
    const today = `${year}.${month}.${date} ${day}`;
    const time = `${hour}:${min}`;
    document.querySelector('.clock-date').innerText = today;
    document.querySelector('.clock-time').innerText = time;
  };

  clock();

  const remainingMillisecond = 1000 - new Date().getUTCMilliseconds();
  setTimeout(function() {
    const remainingsecond = 60000 - new Date().getUTCSeconds() * 1000;
    setTimeout(function() {
      clock();
      setInterval(clock, 60000);
    }, remainingsecond);
  }, remainingMillisecond);
});
