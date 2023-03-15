// $(document).on('change', '#sudent_id', function (evt) {
//   $.ajax({
//     url: '/admins/admin/payments/update_budget.json',
//     type: 'GET',
//     dataType: 'script',
//     data: {
//       location_id: $('#sudent_id option:selected').val(),
//     },
//     error: function (jqXHR, textStatus, errorThrown) {
//       console.log('AJAX Error: ' + textStatus);
//     },
//     success: function (data, textStatus, jqXHR) {
//       console.log('Dynamic location select OK!');
//     },
//   });
// });

// $('#budget_spp_id').empty();
// $.ajax({
//   url: '/admins/admin/payments/update_budget.json',
//   type: 'GET',
//   success: function (data, textStatus, jqXHR) {
//     $('#budget_spp_id').html(data);
//   },
//   error: function (jqXHR, textStatus, errorThrown) {
//     console.log('AJAX Error: ' + textStatus);
//   },
// });

$(document).on('change', '#student_id', function () {
  var student_id = $('#student_id option:selected').val();
  $.ajax({
    url: '/admins/admin/payments/update_budget',
    beforeSend: function (xhr) {
      xhr.setRequestHeader(
        'X-CSRF-Token',
        $('meta[name="csrf-token"]').attr('content')
      );
    },
    type: 'GET',
    data: { student_id: student_id },
    dataType: 'json',
    success: function (data) {
      var options = '';
      data.budget_spps.forEach(function (budget_spp) {
        options +=
          '<option value="' +
          budget_spp.id +
          '">' +
          budget_spp.year +
          ' | ' +
          formatRupiah(budget_spp.total);
        ('</option>');
      });
      $('#budget_spp_id').html(options);
    },
    error: function () {
      console.log('An error occurred while loading the cities.');
    },
  });
});

function formatRupiah(money) {
  return new Intl.NumberFormat(
    'id-ID',
    { style: 'currency', currency: 'IDR', minimumFractionDigits: 0 } // diletakkan dalam object
  ).format(money);
}
