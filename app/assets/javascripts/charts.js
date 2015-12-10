getPoll = function(id) {
  return $.get("api/polls/" + id);
};

updateChart = function(data) {
  new Chartkick.PieChart($('.chart')[0], data.chart_data);
  return data
};

updateChartLinks = function(data) {
  $('.chart-link.previous').data('poll_id', data.prev_id);
  $('.chart-link.next').data('poll_id', data.next_id);
  return data;
};

$(function() {
  $('.chart-link').on('click',  function(event)  {
    event.preventDefault();
    var poll_id = $(this).data('poll_id');
    getPoll(poll_id)
      .then(updateChart)
      .then(updateChartLinks);
  });
});
