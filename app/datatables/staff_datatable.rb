class StaffDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      nip:         { source: "@test.nip", cond: :like, searchable: true, orderable: true },
      name:        { source: "@test.name", cond: :like, searchable: true, orderable: true },
      email:       { source: "@test.email",  cond: :like, searchable: true, orderable: true },
      phone:       { source: "@test.phone", cond: :like, searchable: true, orderable: true },
      status:      { source: "@test.status", cond: :like, searchable: true, orderable: true },
      DT_RowId:    { cond: :null_value, searchable: false, orderable: false },
      DT_actions:  { source: "StaffDecorator.DT_actions", cond: :null_value, searchable: false, orderable: false}
    }
  end
 
  def data
    records.map do |record|
      {
        nip:        record.nip,
        name:       record.name,
        email:      record.email,
        phone:      record.phone,
        status:     record.decorate.status,
        DT_RowId:   record.id,
        DT_actions: record.decorate.DT_actions
      }
    end
  end

  def get_raw_records
    @test = Admin.where(roles: :staff)
  end
end
