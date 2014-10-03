jQuery -> 
  $('#BackgroundColor').ColorPicker({
    color: $('#BackgroundColor').children().first().css("background-color"),
    onShow: (colpkr) ->
      $(colpkr).fadeIn(500)
      return false
    onHide: (colpkr) ->
      $(colpkr).fadeOut(500)
      return false
    onChange: (hsb, hex, rgb) ->
      $('#BackgroundColor div').css('backgroundColor', '#' + hex)
      $('.background_color').attr("value", '#' + hex)
  })

jQuery ->
  $(document).ready ->
    if $(".background_transparent").length > 0
      if $(".background_transparent").is(':checked') is true then $("#backgroundtransparent").hide() else $("#backgroundtransparent").show()

jQuery ->
  $(document).on 'click', '.background_transparent', (e) ->
    if $(e.target).is(':checked') is true then $('#backgroundtransparent').hide() else $('#backgroundtransparent').show()
jQuery ->
  $(document).on 'click', '.no_background_image', (e) ->
    if $(e.target).is(':checked') is true then $('.background_image').hide() else $('.background_image').show()
