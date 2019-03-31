$(document).on("turbolinks:load", function() {
  brass = $('#load_brass_id').html();
  bullets = $('#load_bullet_id').html();
  $('#load_caliber_id').change(function() {
    set_by_caliber(brass, bullets);
  });
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
