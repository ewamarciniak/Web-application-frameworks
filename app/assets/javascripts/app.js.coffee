jQuery ->
  #validation of the registration page
  $('#new_user').submit( ->
    if !isEmail($('#user_email').val())
      $('#user_email').css('background-color','#f7bebe')
      if $('#emailTip').is(":hidden")
        $('#emailTip').toggle(1000)
    if !isValidPassword($('#user_password').val())
      $('#user_password').css('background-color','#f7bebe')
      if $('#passwordTip').is(":hidden")
        $('#passwordTip').toggle(1000)
    if !arePasswordsMatching($('#user_password').val(), $('#user_password_confirmation').val())
      $('#user_password_confirmation').css('background-color','#f7bebe')
      if $('#passwordConfirmationTip').is(":hidden")
        $('#passwordConfirmationTip').toggle(1000)
    if !areAllFieldsValid()
      console.log ('logging in')
      false
  )
  $('#user_password').pwstrength()

  $('#user_email').blur( ->
    $('#user_email').css('background-color','#fff')
    $('#emailTip').hide()
  )

  $('#user_password').blur( ->
    $('#user_password').css('background-color','#fff')
    $('#passwordTip').hide()
  )
  $('#user_password_confirmation').blur( ->
    $('#user_password_confirmation').css('background-color','#fff')
    $('#passwordConfirmationTip').hide()
  )

  isEmail = (string) ->
    # A variable containing a regular expression representing an email address
    emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/
    if (emailPattern.test(string))
      true
    else
      false
  #Stops form details from being submitted

  isValidPassword = (string) ->
    # A variable containing a regular expression representing an email address
    passwordPattern = /^.{6,15}$/
    if (passwordPattern.test(string))
      true
    else
      false
  #Stops form details from being submitted

  #checks if password and confirmation match
  arePasswordsMatching = (password,confirmation) ->
    if (password == confirmation && password.length != 0)
      true
    else
      false

  areAllFieldsValid = () ->
    if !isEmail($('#user_email').val()) || !isValidPassword($('#user_password').val())
      console.log ('1')
      false
    else
      if ($('#user_password_confirmation').length > 0 && !arePasswordsMatching($('#user_password').val(), $('#user_password_confirmation').val()) )
        console.log ('2')
        false
      else
        console.log ('3')
        true

  $('#notice:not(:empty)').removeClass("hide")
  $('#notice_signed_in:not(:empty)').removeClass("hide")
  $('#alert:not(:empty)').removeClass("hide")
  $('#alert_signed_in:not(:empty)').removeClass("hide")

  $('#accordion').accordion()
  $('.chosen-select').chosen()
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
  )


  #morris jquery library
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

