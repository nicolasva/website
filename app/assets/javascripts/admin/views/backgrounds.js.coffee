jQuery ->
  $(document).on 'click', '.no_background_image', (e) ->
    if $(e.target).is(':checked') is true then $('.background_image').hide() else $('.background_image').show()

jQuery -> 
  $('#colorSelectorBackgroundColor').ColorPicker({
    color: $('#colorSelectorBackgroundColor').children().first().css("background-color"),
    onShow: (colpkr) ->
      $(colpkr).fadeIn(500)
      return false
    onHide: (colpkr) ->
      $(colpkr).fadeOut(500)
      return false

  })
