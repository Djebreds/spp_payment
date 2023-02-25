class AdminDatatable < AjaxDatatablesRails::ActiveRecord
  self.db_adapter = :mysql2

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      nip:         { source: "Admin.nip", cond: :like, searchable: true, orderable: true },
      name:        { source: "Admin.name", cond: :like, searchable: true, orderable: true },
      email:       { source: "Admin.email",  cond: :like, searchable: true, orderable: true },
      phone:       { source: "Admin.phone", cond: :like, searchable: true, orderable: true },
      status:      { source: "Admin.status", cond: :like, searchable: true, orderable: true },
      dt_actions:  { source: "AdminDecorator.dt_actions", searchale: false, orderale: false}
    }
  end
  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end


  def data
    records.map do |record|
      {
        nip:      record.decorate.nip,
        name:     record.decorate.name,
        email:    record.decorate.email,
        phone: record.decorate.phone,
        status:   record.decorate.status,
        DT_RowId: record.decorate.id,
        dt_actions: record.decorate.dt_actions
      }
    end
  end

  def get_raw_records
    # insert query here
    Admin.where(roles: :admin).decorate
  end

end
