$(function() {
  $('.row a').on('click',  function(event)  {
    event.preventDefault();
    $.get('api/polls/2', function(data){
      new Chartkick.PieChart($('.chart')[0], data);
    });
  });
});
