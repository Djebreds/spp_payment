class AdminDatatable < AjaxDatatablesRails::ActiveRecord
  self.db_adapter = :mysql2

  def view_columns
    @view_columns ||= {
      nip:         { source: "Admin.nip", cond: :like, searchable: true, orderable: true },
      name:        { source: "Admin.name", cond: :like, searchable: true, orderable: true },
      email:       { source: "Admin.email",  cond: :like, searchable: true, orderable: true },
      phone:       { source: "Admin.phone", cond: :like, searchable: true, orderable: true },
      status:      { source: "Admin.status", cond: :like, searchable: true, orderable: true },
      DT_RowId:    { cond: :null_value, searchable: false, orderable: false },
      DT_actions:  { source: "AdminDecorator.DT_actions", cond: :null_value, searchable: false, orderable: false}
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
    Admin.where(roles: :admin)
  end

end
