// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery.ui.autocomplete
//= require popper
//= require jquery_ujs
//= require activestorage
//= require turbolinks
//= require bootstrap
//= require scoped_search
//= require moment
//= require tempusdominus-bootstrap-4
//= require_tree .

$(document).on("turbolinks:load", function() {
    $('#timepicker').datetimepicker({
        //format: 'HH:mm'
        format: 'HH:mm',
        timeZone: ''
    });
    $('#datepicker').datetimepicker({
        //format: 'HH:mm'
        format: 'YYYY-MM-DD',
        timeZone: ''
    });
    $(document).on('change', '#per_page', function() {
        $('#per_page_form').submit();
    });

    // Code borrowed from Foreman
    uninitialized_autocompletes = $.grep($('.autocomplete-input'), function(i){ return !$(i).next().hasClass('autocomplete-clear'); });
    if (uninitialized_autocompletes.length > 0) {
      $.each(uninitialized_autocompletes, function(i, input) {$(input).scopedSearch({'delay': 250})});
      $('.ui-helper-hidden-accessible').remove();
    }
    /*$(document).on('focus', '#search', function(e) {
        $('.autocomplete-input').scopedSearch();
    });
    */

    $(document).on('click', '#search-reset', function(e) {
      e.preventDefault();
      $('input[name=search]').val('');
      $('#search').submit();
    });

    $('#sidebar').on('hidden.bs.collapse', function() {
      $('[role="main"]').removeClass('col-md-10');
      $('[role="main"]').addClass('col-md-12');
      $('#footer-nav').removeClass('offset-md-2');
      $('#toggle-sidebar').removeClass('offset-md-2');
      $('#toggle-sidebar-icon').removeClass('fa-angle-double-left');
      $('#toggle-sidebar-icon').addClass('fa-angle-double-right');
    })
    $('#sidebar').on('shown.bs.collapse', function() {
      $('[role="main"]').removeClass('col-md-12');
      $('[role="main"]').addClass('col-md-10');
      $('#footer-nav').addClass('offset-md-2');
      $('#toggle-sidebar').addClass('offset-md-2');
      $('#toggle-sidebar-icon').removeClass('fa-angle-double-right');
      $('#toggle-sidebar-icon').addClass('fa-angle-double-left');
    })
});
