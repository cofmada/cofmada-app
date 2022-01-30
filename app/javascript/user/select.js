$(document).on('turbolinks:load', function() {
  let channelId = $('#channel_channel_id').val();
  if (channelId !== "") {
    let selectedVideos = $(`#videos${channelId}`); 
    $('#guide_video_id').remove(); 
    $('#channel_channel_id').after(selectedVideos.html());
  };
  
  let defaultSelect = `<select id="guide_video_id" class="form-control mt-3"><option value>---</option></select>`;

  $(document).on('change', '#channel_channel_id', function() {
    let channelId = $('#channel_channel_id').val();
    if (channelId !== "") {
      let selectedVideos = $(`#videos${channelId}`); 
      $('#guide_video_id').remove(); 
      $('#channel_channel_id').after(selectedVideos.html());
    }else {
      $("#guide_video_id").remove();
      $('#channel_channel_id').after(defaultSelect);
    };
  });
});
