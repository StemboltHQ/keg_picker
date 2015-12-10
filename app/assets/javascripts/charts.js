$(function() {
  $('.row a').on('click',  function(event)  {
    event.preventDefault(); // Prevent link from following its href
    var previous_poll_id = $('#previous-poll').data('poll_id');
    $.get("api/polls/" + previous_poll_id, function(data){
      data: $(event.target).serialize();
            success: new Chartkick.PieChart($('.chart')[0], data.chart_data);
                     $('#previous-poll').data('poll_id', data.prev_id);
    });
  });
});
