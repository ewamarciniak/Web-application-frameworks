jQuery ->
  #validation of the registration page


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



