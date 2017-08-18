$(function () {
  $('.report').on('click', function () {
    if ($(this).next().hasClass('active')) {
      $(this).next().removeClass('active');
    } else {
      $('.asset-wrapper').removeClass('active');
      $(this).next().addClass('active');
    }
  });
});
