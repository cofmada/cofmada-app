document.addEventListener('turbolinks:load', () => {

  const active = () => {
    const day = new Date();
    let hour = day.getHours();
    let min = day.getMinutes();
    $(`#hour${hour}`).addClass("now");
    $('th').not(`#hour${hour}`).removeClass("now");
    if (min >= 0 && min < 30) {
      $(`#just_m${hour}, .just_m${hour}`).addClass("now");
      $('td').not(`#just_m${hour}, .just_m${hour}`).removeClass("now");
    }
    else if (min >= 30) {
      $(`#half_m${hour}, .half_m${hour}`).addClass("now");
      $('td').not(`#half_m${hour}, .half_m${hour}`).removeClass("now");
    }
  };

  active();

  const remainingMillisecond = 1000 - new Date().getUTCMilliseconds();
  setTimeout(function() {
    const remainingsecond = 60000 - new Date().getUTCSeconds() * 1000;
    setTimeout(function() {
      let min = new Date().getMinutes();
      if (min >= 0 && min < 30) {
        const remainingMinute = 1800000 - min * 60000;
        setTimeout(function() {
          active();
          setInterval(active, 1800000);
        }, remainingMinute);
      }
      else if (min >= 30) {
        const remainingMinute = 3600000 - min * 60000;
        setTimeout(function() {
          active();
          setInterval(active, 1800000);
        }, remainingMinute);
      }
    }, remainingsecond);
  }, remainingMillisecond);
});
