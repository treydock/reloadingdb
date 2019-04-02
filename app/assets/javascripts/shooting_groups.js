$(document).on("turbolinks:load", function() {
  var load = $('#shooting_group_load_id').html();
  caliber = $('#shooting_group_caliber_id :selected').text();
  if (caliber) {
    set_by_caliber(load);
  }
  $('#shooting_group_caliber_id').change(function() {
    set_by_caliber(load);
  });

  $('#shooting_group_number').focus(function(e) {
    if ($(this).val()) {
      return;
    }
    shooting_log_id = $('#shooting_group_shooting_log_id :selected').val();
    load_id = $('#shooting_group_load_id :selected').val();
    distance = $('#shooting_group_distance').val();
    data = {shooting_log_id: shooting_log_id, load_id: load_id, distance: distance};
    $.ajax({
      type: 'GET',
      url: '/shooting_groups/next_number',
      dataType: 'json',
      data: data,
      success: function(result) {
        $('#shooting_group_number').val(result['next_number']);
      }
    })
  })

  function set_by_caliber(load) {
      caliber = $('#shooting_group_caliber_id :selected').text();
      if (!caliber) {
        $('#shooting_group_load_id').html(load);
        return
      }
      load_options = $(load).filter("optgroup[label=" + caliber + "]").html();
      if (load_options) {
        $('#shooting_group_load_id').html(load_options);
        if (!$('#shooting_group_load_id :selected')) {
          $('#shooting_group_load_id').prepend("<option value='' selected='selected'></option>");
        }
      } else {
        $('#shooting_group_load_id').empty();
      }
  }
});
