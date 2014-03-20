jQuery ->
  $(document).on 'click', '.no_background_image', (e) ->
    if $(e.target).is(':checked') is true then $('.background_image').hide() else $('.background_image').show()
