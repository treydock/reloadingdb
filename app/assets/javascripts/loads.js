$(document).on("turbolinks:load", function() {
  var brass = $('#load_brass_id').html();
  var bullets = $('#load_bullet_id').html();
  caliber = $('#load_caliber_id :selected').text();
  if (caliber) {
    set_by_caliber(brass, bullets);
  }
  $('#load_caliber_id').change(function() {
    set_by_caliber(brass, bullets);
  });

  $('#calculate-velocity').click(function(e) {
    e.preventDefault();
    id = $(this).data('id');
    $.ajax({
      type: 'GET',
      url: '/loads/' + id + '/calculate_velocity',
      dataType: 'json',
      success: function(result) {
        $('#load_velocity').val(result['velocity']);
      }
    })
  });

  function set_by_caliber(brass, bullets) {
      caliber = $('#load_caliber_id :selected').text();
      if (!caliber) {
        $('#load_brass_id').html(brass);
        $('#load_bullet_id').html(bullets);
        return
      }
      brass_options = $(brass).filter("optgroup[label=" + caliber + "]").html();
      bullet_options = $(bullets).filter("optgroup[label=" + caliber + "]").html();
      if (brass_options) {
        $('#load_brass_id').html(brass_options);
        $('#load_brass_id').prepend("<option value='' selected='selected'></option>");
      } else {
        $('#load_brass_id').empty();
      }
      if (bullet_options) {
        $('#load_bullet_id').html(bullet_options);
        $('#load_bullet_id').prepend("<option value='' selected='selected'></option>");
      } else {
        $('#load_bullet_id').empty();
      }
  }
});
