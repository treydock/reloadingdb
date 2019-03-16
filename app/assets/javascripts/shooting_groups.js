$(document).on("turbolinks:load", function() {
  var load = $('#shooting_group_load_id').html();
  console.log(load);
  caliber = $('#shooting_group_caliber_id :selected').text();
  if (caliber) {
      load_options = $(load).filter("optgroup[label=" + caliber + "]").html();
      console.log(load_options);
      if (load_options) {
        $('#shooting_group_load_id').html(load_options);
        $('#shooting_group_load_id').prepend("<option value='' selected='selected'></option>");
      } else {
        $('#shooting_group_load_id').empty();
      }
  }
  return $('#shooting_group_caliber_id').change(function() {
    caliber = $('#shooting_group_caliber_id :selected').text();
    if (!caliber) {
      return $('#shooting_group_load_id').html(load);
    }
    load_options = $(load).filter("optgroup[label=" + caliber + "]").html();
    console.log(load_options);
    if (load_options) {
      $('#shooting_group_load_id').html(load_options);
      $('#shooting_group_load_id').prepend("<option value='' selected='selected'></option>");
    } else {
      $('#shooting_group_load_id').empty();
    }
  });
});

function loads_by_caliber(caliber) {
    
}