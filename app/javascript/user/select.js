$(document).on('turbolinks:load', function() {
  let channelId = $('#select_channels').val();
  if (channelId !== "") {
    let selectedVideos = $(`#videos${channelId}`); 
    $('#guide_video_id').remove();
    $('.temp').not(`#select${channelId}`).remove();
    $('#select_channels').after(selectedVideos.html());
  };
  
  let defaultSelect = `<select id="guide_video_id" class="form-control mt-3"><option value>---</option></select>`;

  $(document).on('change', '#select_channels', function() {
    let channelId = $('#select_channels').val();
    if (channelId !== "") {
      let selectedVideos = $(`#videos${channelId}`); 
      $('#guide_video_id').remove();
      $('.temp').not(`#select${channelId}`).remove();
      $('#select_channels').after(selectedVideos.html());
    }else {
      $("#guide_video_id").remove();
      $('.temp').not(`#select${channelId}`).remove();
      $('#select_channels').after(defaultSelect);
    };
  });
});
