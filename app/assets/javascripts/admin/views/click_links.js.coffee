jQuery ->
  $('#ColorClickLink').ColorPicker({
    color: $("#ColorClickLink").children().first().css("background-color"),
    onShow: (colpkr) ->
      $(colpkr).fadeIn(500)
      return false
    onHide: (colpkr) ->
      $(colpkr).fadeOut(500)
      return false
    onChange: (hsb, hex, rgb) ->
      $("#ColorClickLink div").css('backgroundColor', '#' + hex)
      $(".color_click_link").attr("value", '#' + hex)
  })

  $('#BackgroundColorClickLink').ColorPicker({
    color: $("#BackgroundColorClickLink").children().first().css("background-color")
    onShow: (colpkr) ->
      $(colpkr).fadeIn(500)
      return false
    onHide: (colpkr) ->
      $(colpkr).fadeOut(500)
      return false
    onChange: (hsb, hex, rgb) ->
      $("#BackgroundColorClickLink div").css('backgroundColor', '#' + hex)
      $(".background_color_click_link").attr("value", '#' + hex)
  })
