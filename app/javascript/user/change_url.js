$(document).on('turbolinks:load', function() {

  let path = location.pathname;
  let newForm = /^.*\/new.*$/;
  let signUp = /^.*\/signup.*$/;
  let editForm = /^.*\/edit.*$/;
  let channelInt = path.slice(10);
  let guideInt = path.slice(8);

  const switchingA = () => {
    $('#hidden_a').show();
    $('#show_a').hide();
  };
  const switchingB = () => {
    $('#hidden_b').show();
    $('#show_b').hide();
  };

  if (path.match(newForm) || path.match(signUp)) {
    return;
  }
  else if (path == '/users') {
    history.replaceState('', '', `/signup`);
  }
  else if (path == '/channels') {
    history.replaceState('', '', `${ path }/new`);
  }
  else if (path == '/guides') {
    history.replaceState('', '', `${ path }/new`);
  }
  
  if (path.match(editForm)) {
    switchingB();
    switchingA();
  }
  else if (path.match('/channels/') && $.isNumeric(channelInt)) {
    switchingB();
    switchingA();
    history.replaceState('', '', `${ path }/edit`);
  }
  else if (path.match('/guides/') && $.isNumeric(guideInt)) {
    switchingB();
    switchingA();
    history.replaceState('', '', `${ path }/edit`);
  }
});
