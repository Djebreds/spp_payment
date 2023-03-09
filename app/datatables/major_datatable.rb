class MajorDatatable < AjaxDatatablesRails::ActiveRecord
  self.db_adapter = :mysql2

  def view_columns
    @view_columns ||= {
      name:       { source: "Major.name", cond: :like, searchable: true, orderable: true },
      short:      { source: "Major.short", cond: :like, searchable: true, orderable: true },
      created_at: { source: "Major.created_at", cond: :like, searchable: true, orderable: true },
      updated_at: { source: "Major.updated_at", cond: :like, searchable: true, orderable: true },
      DT_RowId: { cond: :null_value, searchable: false, orderable: false },
      DT_actions: { source: "MajorDecorator.DT_actions", cond: :null_value, searchable: false, orderable: false}
    }
  end

  def data
    records.map do |record|
      {
        name:       record.name,
        short:      record.short,
        created_at: record.decorate.created_at,
        updated_at: record.decorate.updated_at,
        DT_RowId:   record.id,
        DT_actions: record.decorate.DT_actions
      }
    end
  end

  def get_raw_records
    Major.all
  end
end
