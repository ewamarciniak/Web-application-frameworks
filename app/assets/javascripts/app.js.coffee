jQuery ->
  $('#accordion').accordion()
  $('.chosen-select').chosen()
  $('#user_password').pwstrength()
  $('#exercise_log_exercise_date, #food_intake_log_intake_date, #weight_log_measured_on' ).datepicker
    dateFormat: 'yy-mm-dd'

  if $("input#profile_gender_female").attr('checked')
    $("div#woman").attr('style', 'display:block;')
  $("input[name='profile[gender]']").on('change', ->
    $("#woman").toggle()
  )

  $(document).on("click","#recipes th a, #recipes .pagination a", ->
    $.getScript(this.href)
    false
  )
  # Ajax search on submit
  $('#recipes_search').submit( ->
    $.get(this.action, $(this).serialize(), null, 'script')
    false
  )
  # Ajax search on keyup
  $('#recipes_search input').keyup( ->
    $.get($("#recipes_search").attr("action"), $("#recipes_search").serialize(), null, 'script')
    false
    console.log(this.action)

  )

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
