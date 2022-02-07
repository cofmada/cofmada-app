$(document).on('turbolinks:load', function() {

  let path = location.pathname;
  let newForm = /^.*\/new.*$/;
  let editForm = /^.*\/edit.*$/;

  if (path.match(newForm)) {
    return;
  }
  else if (path == '/channels') {
    history.replaceState('', '', `${ path }/new`);
  }
  else if (path == '/guides') {
    history.replaceState('', '', `${ path }/new`);
  }
  
  if (path.match(editForm)) {
    return;
  }
  else if (path.match('/channels/')) {
    history.replaceState('', '', `${ path }/edit`);
  }
  else if (path.match('/guides/')) {
    history.replaceState('', '', `${ path }/edit`);
  }
});
