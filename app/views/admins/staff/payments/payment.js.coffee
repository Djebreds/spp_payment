$ ->
  $(document).on 'change', '#student_id', (evt) ->
    $.ajax '/admins/admin/update_budget',
      type: 'GET'
      dataType: 'script'
      data: {
        country_id: $("#student_id option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")