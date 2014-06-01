jQuery ->
  $(document).on 'click', '.photo_annoncment', (e) ->
    $(".photo_master").html("")
    $(e.target).clone().prependTo($(".photo_master"))

  $(document).ready ->
    $(".annoncments_list").sortable({
      items: '.annoncment'
      update: ->
        $.ajax({
          url: "/admin/categories/annoncments/sort",
          type: "GET"
          data: $(this).sortable('serialize'),
          failure: ->
            alert("Problem sortable list annoncment")
        })
    })

    $("#annoncment_date_at_html").datepicker({ dateFormat: 'dd/mm/yy' }) 
    $("#annoncment_date_to_html").datepicker({ dateFormat: 'dd/mm/yy' })
