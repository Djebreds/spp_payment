class PaymentMethodDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      name:       { source: "PaymentMethod.name", cond: :like, searchable: true, orderable: true },
      created_at: { source: "PaymentMethod.created_at", cond: :like, searchable: true, orderable: true },
      updated_at: { source: "PaymentMethod.updated_at", cond: :like, searchable: true, orderable: true },
      DT_RowId: { cond: :null_value, searchable: false, orderable: false },
      DT_actions: { source: "PaymentMethodDecorator.DT_actions", cond: :null_value, searchable: false, orderable: false}
    }
  end

  def data
    records.map do |record|
      {
        name:       record.name,
        created_at: record.decorate.created_at,
        updated_at: record.decorate.updated_at,
        DT_RowId:   record.id,
        DT_actions: record.decorate.DT_actions
      }
    end
  end

  def get_raw_records
    PaymentMethod.all
  end
end
