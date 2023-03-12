class MonthlySppDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      month:       { source: "MonthlySpp.month", cond: :like, searchables: true, orderable: true },
      amount:      { source: "MonthlySpp.amount", cond: :like, searchables: true, orderable: true },
      created_at:  { source: "MonthlySpp.created_at", cond: :like, searchables: true, orderable: true },
      updated_at:  { source: "MonthlySpp.updated_at", cond: :like, searchables: true, orderable: true },
      DT_RowId:    { cond: :null_value, searchable: true, orderable: true },
      DT_actions:  { source: "MonthlySppDecorator.DT_actions", cond: :null_value, searchables: false, orderable: false },
    }
  end

  def data
    records.map do |record|
      {
        month:      record.month,
        amount:     record.amount,
        created_at: record.created_at,
        updated_at: record.updated_at,
        DT_RowId:   record.id,
        DT_actions: record.decorate.DT_actions
      }
    end
  end

  def get_raw_records
    MonthlySpp.select("monthly_spps.*").joins(budget_spp: :generation).where("monthly_spps.budget_spp_id = ?", self.params[:budget_spp_id]).where("budget_spps.generation_id", self.params[:geneartion_id])
  end

end
