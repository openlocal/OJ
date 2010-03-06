$('td.i_can_help, td.i_need_help').click(function() {
  window.location = $(this).find('a')[0].href;
});
