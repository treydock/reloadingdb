jQuery(function() {
  var brass = $('#load_brass_id').html();
  var bullets = $('#load_bullet_id').html();
  console.log(brass);
  return $('#load_caliber_id').change(function() {
    caliber = $('#load_caliber_id :selected').text();
    if (!caliber) {
      $('#load_brass_id').html(brass);
      return $('#load_bullet_id').html(bullets);
    }
    brass_options = $(brass).filter("optgroup[label=" + caliber + "]").html();
    bullet_options = $(bullets).filter("optgroup[label=" + caliber + "]").html();
    console.log(brass_options);
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
  });
});

jQuery(document).ready(function() {
  $('#loads-datatable').dataTable({
    "processing": true,
    "serverside": true,
    "ajax": $('#loads-datatable').data('source'),
    "pagingType": "full_numbers",
    "columns": [
      {"data": "date"},
      {"data": "bullet"},
      {"data": "powder"},
      {"data": "powder_weight"},
    ]
  });
});


