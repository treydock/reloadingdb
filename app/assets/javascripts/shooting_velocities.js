$(document).on("turbolinks:load", function() {
  $('#add-velocity').click(function(e) {
    e.preventDefault();
    e.stopPropagation();
    add_velocity_field();
  });

  load = $('#shooting_velocity_load_id').html();
  $('#shooting_velocity_caliber_id').change(function() {
    set_by_caliber(load);
  });

});

function add_velocity_field() {
  $last_velocity_field = $('input[id="shooting_velocity_velocities"]:first-of-type').clone();
  $last_velocity_field.removeAttr('id');
  $last_velocity_field.removeAttr('style');
  $last_velocity_field.val('');
  $('.append-velocities').append($last_velocity_field);
}

function set_by_caliber(load) {
    caliber = $('#shooting_velocity_caliber_id :selected').text();
    if (!caliber) {
      $('#shooting_velocity_load_id').html(load);
      return
    }
    load_options = $(load).filter("optgroup[label=" + caliber + "]").html();
    if (load_options) {
      $('#shooting_velocity_load_id').html(load_options);
      $('#shooting_velocity_load_id').prepend("<option value='' selected='selected'></option>");
    } else {
      $('#shooting_velocity_load_id').empty();
    }
}
