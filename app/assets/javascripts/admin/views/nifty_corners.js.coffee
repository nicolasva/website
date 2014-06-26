jQuery ->
  $(document).on 'click', '.class_nifty_corner', (e) ->
    element_border_radius = $(e.target).parent().parent().parent().parent().children().slice(-2).first()
    if $(e.target).is(':checked')
      element_border_radius.show()
    else
      element_border_radius.hide()

  $(document).ready ->
    if $(".class_nifty_corner").length > 0
      element_border_radius = $(".class_nifty_corner").parent().parent().parent().parent().children().slice(-2).first()
      if $(".class_nifty_corner").is(':checked')
        element_border_radius.show()
      else
        element_border_radius.hide()

