# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  Morris.Line
    element: 'weight_logs_chart'
    data: $('#weight_logs_chart').data('weight-logs')
    xkey: 'measured_on'
    ykeys: ['weight']
    labels: ['Weight']
    smooth: true
    postUnits: 'kg'
    goals: [$('#min').text(), $('#max').text()]
    goalStrokeWidth: 1
    goalLineColors: ['#FF0000' ]