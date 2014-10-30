jQuery ->
  $("#font_color").ColorPicker({
    color: $('#font_color').children().first().css("background-color"),
    onShow: (colpkr) ->
      $(colpkr).fadeIn(500)
      return false
    onHide: (colpkr) ->
      $(colpkr).fadeOut(500)
      return false
    onChange: (hsb, hex, rgb) ->
      $('#font_color div').css('backgroundColor', '#' + hex)
      $('.class_font_color_title').attr("value", '#' + hex)
  })
jQuery ->
  $(document).on 'click', '#header_background_watch_title', (e) ->
    element = $("#personalize_title_header_background")
    set_watch_title_personalize_website(element, $(e.target))


  $(document).on 'click', '#header_background_text_or_image', (e) ->
    set_text_or_image($(e.target).is(':checked'))

  $(document).ready ->
    location_href = window.location.href
    exp_header_background_url = new RegExp("^.{1,}(header_backgrounds).{1,}$","g")
    exp_header_background_edit = new RegExp("^.{1,}(edit)$","g")

    if exp_header_background_url.test(location_href) && exp_header_background_edit.test(location_href) == false 
      exp_header_backgrounds = new RegExp("^.{1,}\/header_backgrounds\/(.{1,})$","g")

      header_backgrounds_uuid = exp_header_backgrounds.exec(location_href)[1]
      $.getJSON("/admin/header_backgrounds/"+header_backgrounds_uuid, (data) -> 
        #console.log $(".header_background").css("background-color", data.background.background_color)
        $(".header_background").css("background", "url('"+data.background.background_image.url+"') " + if data.background.no_repeat is true then + 'no-repeat' else '') unless data.background.no_background_image
        $(".header_background").css("border", data.background.border+" "+data.background.border_style+" "+data.background.border_color)
      )

    if $("#header_background_watch_title").length > 0
      element = $("#personalize_title_header_background")
      set_watch_title_personalize_website(element, $("#header_background_watch_title"))
      set_text_or_image($("#header_background_text_or_image").is(':checked'))


set_watch_title_personalize_website = (element, target) ->
  if target.is(":checked")
    element.show()
  else
    element.hide()

set_text_or_image = (checked) ->
  if checked 
    $("#text").show() 
    $("#image").hide()
  else
    $("#text").hide() 
    $("#image").show()
