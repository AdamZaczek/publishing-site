$(document).on "page:change", ->
  $('#comments-link').click (event) ->
    event.preventDefault()
    $('#comment-section').fadeToggle()
    $('#comment_content').focus()