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
  ajax: $('#datatables-column-search-text-inputs').data('source'),
  lengthChange: false,
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
