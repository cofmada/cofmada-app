document.addEventListener('turbolinks:load', () => {

  const schedule = () => {
    const day = new Date();
    let hour = day.getHours();
    let min = day.getMinutes();
    $('#onair + div').remove();
    $('#next + div').remove();
    if (min >= 0 && min < 30) {
      document.querySelector('#onair').innerText = `${hour}:00`;
      $('#onair').after($(`#just${hour}`).html());
      document.querySelector('#next').innerText = `${hour}:30`;
      $('#next').after($(`#half${hour}`).html());
    }
    else if (min >= 30) {
      document.querySelector('#onair').innerText = `${hour}:30`;
      $('#onair').after($(`#half${hour}`).html());
      if (hour < 23) {
        document.querySelector('#next').innerText = `${hour+1}:00`;
        $('#next').after($(`#just${hour+1}`).html());
      }
      else if (hour == 23) {
        document.querySelector('#next').innerText = `0:00`;
        $('#next').after($(`#just0`).html());
      }
    }
  };

  schedule();

  const remainingMillisecond = 1000 - new Date().getUTCMilliseconds();
  setTimeout(function() {
    const remainingsecond = 60000 - new Date().getUTCSeconds() * 1000;
    setTimeout(function() {
      let min = new Date().getMinutes();
      if (min >= 0 && min < 30) {
        const remainingMinute = 1800000 - min * 60000;
        setTimeout(function() {
          schedule();
          setInterval(schedule, 1800000);
        }, remainingMinute);
      }
      else if (min >= 30) {
        const remainingMinute = 3600000 - min * 60000;
        setTimeout(function() {
          schedule();
          setInterval(schedule, 1800000);
        }, remainingMinute);
      }
    }, remainingsecond);
  }, remainingMillisecond);
});
