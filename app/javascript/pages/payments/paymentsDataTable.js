// DataTables
var table = $('#datatables-column-search-text-inputs').DataTable({
  columns: [
    {
      data: 'DT_RowId',
      render: function (data, type, row, meta) {
        return meta.row + meta.settings._iDisplayStart + 1;
      },
    },
    {
      data: 'name',
    },
    {
      data: 'nis',
    },
    {
      data: 'admin_name',
    },
    {
      data: 'year',
    },
    {
      data: 'month',
    },
    {
      data: 'year_total',
    },
    {
      data: 'total',
    },
    {
      data: 'status',
    },
    {
      data: 'created_at',
    },
    {
      data: 'updated_at',
    },
    {
      data: 'DT_actions',
      searchable: false,
    },
  ],
  order: [],
  language: {
    processing: `
                    <div class="progress-bar">
                        <div class="progress-bar-value"></div>
                    </div>
                    `,
  },
  responsive: true,
  scrollX: true,
  processing: true,
  serverSide: true,
  ajax: {
    url: $('#datatables-column-search-text-inputs').data('source'),
    data: function (d) {
      return $.extend({}, d, {
        status: $('#status').val(),
      });
    },
  },
  lengthChange: false,
  dom: 'Bfrtip',
  buttons: [
    {
      extend: 'print',
      className: 'btn btn-secondary',
      titleAttr: 'Print',
      text: `<span class="icon text-white me-2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-printer-fill" viewBox="0 0 16 16">
        <path d="M5 1a2 2 0 0 0-2 2v1h10V3a2 2 0 0 0-2-2H5zm6 8H5a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1z"/>
        <path d="M0 7a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2h-1v-2a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2v2H2a2 2 0 0 1-2-2V7zm2.5 1a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z"/>
      </svg></span><span class="text">Print</span>`,
      //autoPrint: false,
      customize: function (doc) {
        var now = new Date();
        var jsDate =
          now.getDate() + '-' + (now.getMonth() + 1) + '-' + now.getFullYear();
        $(doc.document.body).prepend(
          `
              <div class="header">
                  <div class="container">
                  <div class="row justify-content-center align-items-center">
                      <div class="col-2">
                          <img src="https://www.dbl.id/uploads/school/3960/115-SMKN_1_KATAPANG.png" width="130px">
                      </div>
                      <div class="col-10">
                          <div class="header text-center">
                          <h4 class="mb-0" style="font-size: 15px;">PEMERINTAH DAERAH PROVINSI JAWA BARAT </h4>
                          <h4 class="mb-0" style="font-size: 15px;">DINAS PENDIDIKAN</h4>
                          <h4 class="mb-0" style="font-weight: bold; font-size: 18px;">CABANG DINAS PENDIDIKAN WILAYAH VIII</h4>
                          <h4 class="mb-0" style="font-weight: bold; font-size: 18px;">SEKOLAH MENEGAH KEJURUSAN NEGERI 1 KATAPANG</h3>
                          <h6 class="mb-0" >NSS: 341020828004 NPSN : 20206214</h6>
                          <p class="mb-0" style="font-size: 12px; color: #495057; font-weight: 500">Jln. Ceuri Terusan Kopo KM. 13,5 Telepon: (022) 589-3737</p>
                          <p class="mb-0" style="font-size: 10px; color: #495057; font-weight: 500">
                              Faksimil: (022) 589-3636 Website: http://smkn1katapang.sch.id e-mail : smkn1katapang@bdg.centrin.net.id
                              Kabupatan Bandung - 40921
                          </p>
                          </div>
                      </div>
                      <div class="border border-top border-dark mt-2"></div>
                      <div class="border border-top border-1 border-dark" style="margin-top: 0.8px"></div>
                  </div>
                  <div class="text-center mt-3">
                      <h6 class="mb-0" style="font-weight: bold;">LAPORAN PEMBAYARAN SPP</h6>
                      <h6 class="mb-0" style="font-weight: bold;">SMKN 1 KATAPANG TANGGAL 2023-2024</h6>
                  </div>
                  </div>
              </div>
              `
        );
        $(doc.document.body).append(
          `
                <div class="footer">
                    <div class="container">
                    <div class="row justify-content-end">
                        <div class="col-4">
                            <h6 class="mb-0" style="font-weight: bold;">Kepala Sekolah</h6>
                            <h6 class="mb-0" style="font-weight: bold;">SMKN 1 KATAPANG</h6>
                            <br>
                            <br>
                            <br>
                            <h6 class="mb-0" style="font-weight: bold;">Dr. H. Dadang Jebred</h6>
                            <h6 class="mb-0" style="font-weight: bold;">NIP. 10211823923923</h6>
                        </div>
                    </div>
                </div>
                `
        );
        $(doc.document.body)
          .find('table')
          .removeClass('dataTable')
          .css('font-size', '12px')
          .css('margin-top', '20px')
          .css('margin-bottom', '60px');
        $(doc.document.body)
          .find('th')
          .each(function (index) {
            $(this).css('font-size', '13px');
            $(this).css('font-family', 'Times New Roman');
            $(this).css('color', '#black');
            $(this).css('background-color', 'blue');
          });
      },
      title: '',
      exportOptions: {
        columns: [0, 1, 2, 3, 4],
        orthogonal: 'Export-print',
      },
      init: function (api, node, config) {
        $(node).removeClass('dt-button');
      },
    },
  ],
});

$('#datatables-column-search-text-inputs tfoot th.filter').each(function () {
  var title = $(this).text();
  $(this).html(
    '<input type="text" class="form-control" placeholder="Cari ' +
      title +
      '" />'
  );
});

// Apply the search
table.columns().every(function () {
  var that = this;
  $('input', this.footer()).on('keyup change clear', function () {
    if (that.search() !== this.value) {
      that.search(this.value).draw();
    }
  });
});

$('#search').on('keyup change clear', function () {
  table.search(this.value).draw();
});

$('.button-action').append($('.buttons-print'));
$('.search-action').append($('.dataTables_filter'));
$('.dataTables_filter').addClass('d-none');

$('.loading').append($('div.dataTables_processing'));

$('#status').change(function () {
  table.ajax.reload();
});
