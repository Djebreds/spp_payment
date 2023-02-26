class MajorDatatable < AjaxDatatablesRails::ActiveRecord
  self.db_adapter = :mysql2

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      name:       { source: "Major.name", cond: :like, searchable: true, orderable: true },
      short:      { source: "Major.short", cond: :like, searchable: true, orderable: true },
      created_at: { source: "Major.created_at", cond: :like, searchable: true, orderable: true },
      updated_at: { source: "Major.updated_at", cond: :like, searchable: true, orderable: true }
    }
  end

  def data
    records.map do |record|
      {
        name:       record.name,
        short:      record.short,
        created_at: record.created_at
        updated_at: record.updated_at
      }
    end
  end

  def get_raw_records
    Major.all
  end

end
