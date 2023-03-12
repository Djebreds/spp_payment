class GenerationDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      years:       { source: "Generation.years", cond: :like, searchable: true, orderable: true },
      total:       { source: "total", cond: :like, searchable: true, orderable: true },
      created_at: { source: "Generation.created_at", cond: :like, searchable: true, orderable: true },
      updated_at: { source: "Generation.updated_at", cond: :like, searchable: true, orderable: true },
      DT_RowId:   { cond: :null_value, searchable: false, orderable: false },
      DT_actions: { source: "GenerationDecorator.DT_actions", cond: :null_value, searchable: false, orderable: false}
    }
  end

  def data
    records.map do |record|
      {
        years:      record.years,
        total:      record[:total],
        created_at: record.decorate.created_at,
        updated_at: record.decorate.updated_at,
        DT_RowId:   record.id,
        DT_actions: record.decorate.DT_actions
      }
    end
  end

  def get_raw_records
    Generation.all.select("generations.*, sum(monthly_spps.amount) AS total").joins(budget_spps: :monthly_spps).group("generations.id")
  end

  def records_total_count
    fetch_records.unscope(:group).unscope(:select).unscope(:joins).count(:all)
  end

  def records_filtered_count
    filter_records(fetch_records).unscope(:group).unscope(:select).unscope(:joins).count(:all)
  end

end
