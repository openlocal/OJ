$('td.i_can_help, td.i_need_help, td.how_it_works').click(function() {
  window.location = $(this).find('a')[0].href;
});
