$(document).on("turbolinks:load", function() {
  load = $('#shooting_group_load_id').html();
  $('#shooting_group_caliber_id').change(function() {
    set_by_caliber(load);
  });

});

function set_by_caliber(load) {
    caliber = $('#shooting_group_caliber_id :selected').text();
    if (!caliber) {
      $('#shooting_group_load_id').html(load);
      return
    }
    load_options = $(load).filter("optgroup[label=" + caliber + "]").html();
    if (load_options) {
      $('#shooting_group_load_id').html(load_options);
      $('#shooting_group_load_id').prepend("<option value='' selected='selected'></option>");
    } else {
      $('#shooting_group_load_id').empty();
    }
}
