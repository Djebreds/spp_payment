$(document).on('change', '#budget_spp_id', function () {
  var budget_spp_id = $('#budget_spp_id option:selected').val();
  $.ajax({
    url: '/admins/admin/payments/update_monthly',
    type: 'GET',
    data: { budget_spp_id: budget_spp_id },
    dataType: 'json',
    beforeSend: function (xhr) {
      xhr.setRequestHeader(
        'X-CSRF-Token',
        $('meta[name="csrf-token"]').attr('content')
      );
    },
    success: function (data) {
      var options = '';
      var total = '';
      //   alert(data.monthly_spps[0]['amount']);
      //   console.log(data.monthly_spps[0]['amount']);
      var i = 1;
      data.monthly_spps.forEach(function (monthly_spp) {
        options += `<option label="${i++}" value="${monthly_spp.amount}">${
          monthly_spp.month
        } | ${formatRupiah(monthly_spp.amount)}</option>`;
      });
      $('#monthly_spp_id').html(options);
    },
    // $('#total').html(total);
    error: function () {
      console.log('An error occurred while loading the cities.');
    },
  });
  //   getTotalbudget_spp_id.options[budget_spp_id.selectedIndex].text;
});

$(document).on('change', '#monthly_spp_id', function () {
  var budget_spp_id = $('#budget_spp_id option:selected').val();
  var pal = $(this).val();
  var options = `
            <option value="${pal}">${pal}</option>
            `;
  $('#total').html(options);
});

function formatRupiah(money) {
  return new Intl.NumberFormat(
    'id-ID',
    { style: 'currency', currency: 'IDR', minimumFractionDigits: 0 } // diletakkan dalam object
  ).format(money);
}
