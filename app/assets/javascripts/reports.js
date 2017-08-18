$(function () {
  $('.report').on('click', function () {
    if ($(this).next().hasClass('active')) {
      $(this).next().removeClass('active');
    } else {
      $('.assets').removeClass('active');
      $(this).next().addClass('active');
    }
  });
});
