jQuery ->
  $(document).ready ->
    $(".category_list").sortable({
      items: '.category'
      update: ->
        $.ajax({
          url: "/admin/categories/sort",
          type: "GET",
          data: $(this).sortable('serialize'),
          failure: ->
            alert("Problem sortable list")
        })
    })
