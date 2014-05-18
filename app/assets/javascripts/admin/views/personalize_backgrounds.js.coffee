jQuery ->
  $("#FontColor").ColorPicker({
    color: $('#FontColor').children().first().css("background-color"),
    onShow: (colpkr) ->
      $(colpkr).fadeIn(500)
      return false
    onHide: (colpkr) ->
      $(colpkr).fadeOut(500)
      return false
    onChange: (hsb, hex, rgb) ->
      $("#FontColor div").css("backgroundColor", '#' + hex)
      $("#personalize_background_font_color").attr("value", '#' + hex)
  })
