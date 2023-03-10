class BudgetSppDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      year:       { source: "BudgetSpp.year", cond: :like, searchable: true, orderable: true },
      total:      { source: "total", cond: :like, searchable: true, orderable: true },
      created_at: { source: "BudgetSpp.created_at", cond: :like, searchable: true, orderable: true },
      updated_at: { source: "BudgetSpp.updated_at", cond: :like, searchable: true, orderable: true },
      DT_RowId: { cond: :null_value, searchable: false, orderable: false },
      DT_actions: { source: "BudgetSppDecorator.DT_actions", cond: :null_value, searchable: false, orderable: false}
    }
  end

  def data
    records.map do |record|
      {
        year:       record.year,
        total:     record[:total],
        created_at: record.created_at,
        updated_at: record.updated_at,
        DT_RowId:   record.id,
        DT_actions: record.decorate.DT_actions
      }
    end
  end

  def get_raw_records
    # BudgetSpp.joins(:generation).where('budget_spps.generation_id = ?', self.params[:generation_id])
    # BudgetSpp.select(
    #   "budget_spps.year, budget_spps.created_at, budget_spps.updated_at, budget_spps.generation_id, sum(monthly_spps.amount AS total)"
    # ).joins(:generation, :monthly_spps)
    # BudgetSpp.select("budget_spps.*", "generations.*", "sum(monthly_spps.amount) AS total")
    #   .joins(:generation, :monthly_spps)
    #   .where('budget_spps.generation_id = ?', self.params[:generation_id]).where('monthly_spps.budget_spp_id = ?', self.params[:id])

    # BudgetSpp.select("budget_spp.*", "sum(monthly_spps.amount)").joins(:generation, :monthly_spps)

    BudgetSpp.select("budget_spps.*, sum(monthly_spps.amount) AS total").joins(:monthly_spps).where("budget_spps.generation_id = ?", self.params[:generation_id]).group("budget_spps.id")
    

  end
end
