$(document).on('turbolinks:load', function() {

  let path = location.pathname;
  let newForm = /^.*\/new.*$/;
  let editForm = /^.*\/edit.*$/;
  let channelInt = path.slice(10);
  let guideInt = path.slice(8);

  const switching = () => {
    $('#hidden').show();
    $('#show').hide();
  };
  const switchings = () => {
    $('#hiddens').show();
    $('#shows').hide();
  };

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
    switchings();
    switching();
  }
  else if (path.match('/channels/') && $.isNumeric(channelInt)) {
    switchings();
    switching();
    history.replaceState('', '', `${ path }/edit`);
  }
  else if (path.match('/guides/') && $.isNumeric(guideInt)) {
    switchings();
    switching();
    history.replaceState('', '', `${ path }/edit`);
  }
});
