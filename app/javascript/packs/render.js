document.addEventListener('turbolinks:load', () => {
  const path = location.pathname;
  const id = document.getElementById('id').value;
  const guide = '/guides/' + id;
  const channel = '/channels/' + id;
  
  if (path == "/users") {
    history.replaceState('', '', '/signup');
  }else if (path == "/guides") {
    history.replaceState('', '', '/guides/new');
  }else if (path == guide) {
    history.replaceState('', '', guide +'/edit');
  }else if (path == "/channels") {
    history.replaceState('', '', '/channels/new');
  }else if (path == channel) {
    history.replaceState('', '', channel +'/edit');
  }
});
