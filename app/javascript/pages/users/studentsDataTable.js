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
      data: 'nisn',
    },
    {
      data: 'nis',
    },
    {
      data: 'years',
    },
    {
      data: 'class_room',
      render: function (data, type, room) {
        // if ( type === 'display' || type === 'filter' ) {
        //     return row.tblmembers.MemberFirstName+' '+row.tblmembers.MemberLastName;
        //     } else {
        //     return row.tblmembers.MemberLastName;
        //     }
        if (type === 'display' || type === 'filter' || type === 'search') {
          return (data = room.class_room + '-' + room.major);
        } else {
          return (data = room.class_room);
        }
      },
    },
    {
      data: 'major',
      visible: false,
    },
    {
      data: 'status',
      title: 'status',
      render: function (data, type, stats) {
        switch (stats['status']) {
          case 'active':
            return `<span class="badge rounded-pill bg-success">${stats['status']}</span>`;
          case 'inactive':
            return `<span class="badge rounded-pill bg-danger">${stats['status']}</span>`;
        }
      },
      searchable: true,
      orderable: true,
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
