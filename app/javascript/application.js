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
  buttons: ['copy', 'excel', 'pdf'],
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
