document.addEventListener('turbolinks:load', () => {

  const active = () => {
    const day = new Date();
    let hour = day.getHours();
    $(`#hour${hour}`).css("color", "#218838");;
    $('th').not(`#hour${hour}`).css("color", "");;
  };

  active();
  
  const remainingMillisecond = 1000 - new Date().getUTCMilliseconds();
  setTimeout(function() {
    const remainingsecond = 60000 - new Date().getUTCSeconds() * 1000;
    setTimeout(function() {
      const remainingMinute = 3600000 - new Date().getUTCMinutes() * 60000;
      setTimeout(function() {
        active();
        setInterval(active, 3600000);
      }, remainingMinute);
    }, remainingsecond);
  }, remainingMillisecond);
});
