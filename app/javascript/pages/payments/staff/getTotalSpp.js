$(document).on('change', '#monthly_spp_id', function () {
  var monthly_spp_id = $('#monthly_spp_id option:selected').val();
  $.ajax({
    url: '/admins/staff/payments/update_monthly',
    type: 'GET',
    data: { monthly_spp_id: monthly_spp_id },
    beforeSend: function (xhr) {
      xhr.setRequestHeader(
        'X-CSRF-Token',
        $('meta[name="csrf-token"]').attr('content')
      );
    },

    dataType: 'json',
    success: function (data) {
      var options = '';
      data.monthly_spps.forEach(function (monthly_spp) {
        options +=
          '<option value="' +
          monthly_spp.amount +
          '">' +
          formatRupiah(monthly_spp.amount);
        ('</option>');
      });
      $('#total').html(options);
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
