jQuery ->
  $(document).ready -> 
    location_href = window.location.href
    exp_sub_menu_backgrounds_url = new RegExp("^.{1,}(sub_menu_backgrounds).{1,}$","g")
    exp_sub_menu_background_edit = new RegExp("^.{1,}(edit)$","g")

    if exp_sub_menu_backgrounds_url.test(location_href)
      exp_sub_menu_backgrounds = new RegExp("^.{1,}\/sub_menu_backgrounds\/(.{1,})$","g")
      sub_menu_backgrounds_uuid = exp_sub_menu_backgrounds.exec(location_href)[1]
      sub_menu_backgrounds_uuid = if parseInt(sub_menu_backgrounds_uuid.split("/").length) is 2 then sub_menu_backgrounds_uuid.split("/")[0] else sub_menu_backgrounds_uuid
      #sub_menu_backgrounds_uuid = 
      $.getJSON("/admin/sub_menu_backgrounds/"+sub_menu_backgrounds_uuid, (data) ->
        if exp_sub_menu_background_edit.test(location_href) == false
          $(".sub_menu_background").css("background-color", data.background.background_color)
          $(".sub_menu_background").css("background", "url('"+data.background.background_image.url+" "+ if data.background.no_repeat is true then + 'no_repeat' else '' +"')") unless data.background.no_background_image
          $(".sub_menu_background").css("border", data.background.border+" "+data.background.border_style+" "+data.background.border_color)
        else
          $.getJSON("/admin/menu_backgrounds/get_activation", (menu) -> 
            #console.log data.align.align
            if menu.align.align is data.align.align then $(".all_background_image").hide() else $(".all_background_image").show()
            #$(".background_image").hide()
          )
      )

jQuery ->
  $(document).on 'click', '#sub_menu_background_align_attributes_align', (e) ->
    $.getJSON("/admin/menu_backgrounds/get_activation", (menu) -> 
      if parseInt($(e.target).attr("value")) is parseInt(menu.align.align) then $(".all_background_image").hide() else $(".all_background_image").show()
    )


