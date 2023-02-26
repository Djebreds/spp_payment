// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';
import 'jquery';
import 'select2';
import 'plugins/datatables';
import 'theme/theme';

$('#datatables-column-search-text-inputs tfoot th.filter').each(function () {
  var title = $(this).text();
  $(this).html(
    '<input type="text" class="form-control" placeholder="Search ' +
      title +
      '" />'
  );
});
// DataTables
var table = $('#datatables-column-search-text-inputs').DataTable({
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
  ajax: $('#datatables-column-search-text-inputs').data('source'),
  lengthChange: false,
  dom: 'Bfrtip',
  buttons: [
    'copy',
    'csv',
    {
      extend: 'print',
      className: 'btn btn-primary btn-icon-split',
      titleAttr: 'Stampa Tabella',
      text: '<span class="icon text-white-50"><i class="fa fa-print"></i></span><span class="text"> Stampa</span>',
      footer: false,
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
  columns: [
    {
      data: 'nip',
    },
    {
      data: 'name',
    },
    {
      data: 'email',
    },
    {
      data: 'phone',
    },
    {
      data: 'status',
    },
    {
      data: 'dt_actions',
    },
  ],
  columnDefs: [
    {
      searchable: false,
      orderable: false,
      targets: 0,
    },
  ],
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

$('.col-sm-12.col-md-6').first().append($('#add'));
$('#add>button').click(function refreshData() {
  table.ajax.reload(null, true);
});
$('.col-sm-12.col-md-6:eq(1)').addClass('my-auto');
$('.loading')
  .appendTo(
    '.col-sm-12>#datatables-column-search-text-inputs_wrapper>.row:eq(0)'
  )
  .first();
$('.loading').append($('div.dataTables_processing'));
