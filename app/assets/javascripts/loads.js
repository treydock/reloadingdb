jQuery(function() {
  var brass = $('#load_brass_id').html();
  var bullets = $('#load_bullet_id').html();
  console.log(brass);
  return $('#load_caliber_id').change(function() {
    caliber = $('#load_caliber_id :selected').text();
    brass_options = $(brass).filter("optgroup[label=" + caliber + "]").html();
    bullet_options = $(bullets).filter("optgroup[label=" + caliber + "]").html();
    console.log(brass_options);
    if (brass_options) {
      $('#load_brass_id').html(brass_options);
    } else {
      $('#load_brass_id').empty();
    }
    if (bullet_options) {
      $('#load_bullet_id').html(bullet_options);
    } else {
      $('#load_bullet_id').empty();
    }
  });
});

