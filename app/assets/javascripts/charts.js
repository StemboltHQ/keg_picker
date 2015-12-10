$(function() {
  $('.row a').on('click',  function(event)  {
    event.preventDefault(); // Prevent link from following its href
    var previous_poll_id = $('#previous-poll').data('poll_id');
    var next_poll_id = $('#next-poll').data('poll_id');
    var get_url;
    if(this.id=="previous_graph") {
      get_url = "api/polls/" + previous_poll_id;
    }
    else {
      get_url = "api/polls/" + next_poll_id;
    }

    $.get(get_url, function(data){
      data: $(event.target).serialize();
            success: new Chartkick.PieChart($('.chart')[0], data.chart_data);
                     $('#previous-poll').data('poll_id', data.prev_id);
                     $('#next-poll').data('poll_id', data.next_id);
    });
  });
});
