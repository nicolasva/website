HASH_ALIGN_CSS =
  0 : "center center"
  3 : "right bottom"
  4 : "right top"
  5 : "right center"
  6 : "left top"
  7 : "left center"
  8 : "left bottom"
  9 : "center top"
  10 : "center bottom"
  11 : "center center"
  12 : "full screen"

HASH_ANNONCMENT_FONT_WEIGHT_TITLE = 
  0: "normal"
  1: "lighter"
  2: "bold"
  3: "bolder"

HASH_ANNONCMENT_TEXT_DECORATION_TITLE =
  0: "none"
  1: "underline"
  2: "overline"
  3: "line-through"
  4: "blink"

jQuery ->
  $(document).ready ->
    exp_annoncment = new RegExp("^.{1,}(annoncments)$","g")
    location_href  = window.location.href

    exp_get_url = new RegExp("(^.{1,})annoncments$","g") 
    unless _.isEmpty(location_href.scan(exp_annoncment))
      get_url = location_href.scan(exp_annoncment)[0][0]
      if exp_annoncment.test(location_href)
        $(".annoncment").each (key, value) ->
          annoncment_id = $(value).attr("class").split(" ").slice(-1)[0].split("_").slice(-1)[0]
          $.getJSON(get_url+"/"+annoncment_id, (data) ->
            unless _.isNull(data)
              $(".annoncment").css("background-color", data.background.background_color)
              $(".annoncment").css("background", "url('"+data.background.background_image.url+"') "+ if data.background.no_repeat is true then 'no-repeat' else '') unless data.background.no_background_image
              $(".annoncment").css("border", data.background.border+" "+data.background.border_style+" "+data.background.border_color)
          )
      
          #Set attribute css
    get_title_annoncment = location_href.split("/").slice(-1)
    exp_get_url_show_annoncment = new RegExp("(^.{1,})annoncments.{1,}$","g")
    unless _.isEmpty(location_href.scan(exp_get_url_show_annoncment)) 
      #Zoombox for galery image
      $('a.zoombox').zoombox()
      get_url_show_annoncment = location_href.scan(exp_get_url_show_annoncment)[0][0]
      $.getJSON(get_url_show_annoncment+"annoncments/"+get_title_annoncment, (data) ->
        #console.log data
        $(".title_annoncment").css("font-weight", HASH_ANNONCMENT_FONT_WEIGHT_TITLE[data.font_weight_title])
        $(".title_annoncment").css("font-size", data.font_size_title+"pt")
        $(".title_annoncment").css("text-decoration", HASH_ANNONCMENT_TEXT_DECORATION_TITLE[data.text_decoration_title])
        background = data.background 
        element = ".annoncment"
        unless background.no_background_image
          $(element).css("background", "url('"+background.background_image.header.url+"') " + if background.no_repeat is true then 'no-repeat' else '')
          $(element).css("background-position", HASH_ALIGN_CSS[background.align])
          $(element).css("background-size", "cover")
          if background.align == 11
            $(element).css("-moz-background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
            $(element).css("-o-background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
            $(element).css("-webkit-background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
            $(element).css("background-size", $('#id_header').css("width")+" "+$('#id_header').css("height"))
        $(element).css("background-color", background.background_color)
        $(element).css("border", background.border+"px "+background.border_style+" "+background.border_color)
      )
