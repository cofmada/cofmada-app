
$(document).on('turbolinks:load', function() {
  let channelId = $('#guide_channel_id').val();
  if (channelId !== "") {
    let selectedVideos = $(`#videos${channelId}`); 
    $('#guide_videoid').remove(); 
    $('#guide_channel_id').after(selectedVideos.html());
  };
  
  let defaultSelect = `<select id="guide_videoid" class="form-control mt-3"><option value>---</option></select>`;

  $(document).on('change', '#guide_channel_id', function() {
    let channelId = $('#guide_channel_id').val();
    if (channelId !== "") {
      let selectedVideos = $(`#videos${channelId}`); 
      $('#guide_videoid').remove(); 
      $('#guide_channel_id').after(selectedVideos.html());
    }else {
      $("#guide_videoid").remove();
      $('#guide_channel_id').after(defaultSelect);
    };
  });
});
