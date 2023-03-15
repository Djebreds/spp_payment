class HistroyPaymentDatatableDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      name:        { source: "Student.name", cond: :like, searchable: true, orderable: true },
      nis:         { source: "Student.nis", cond: :like, searchable: true, orderable: true },
      admin_name:  { source: "Admin.name", cond: :like, searchable: true, orderable: true },
      year:        { source: "BudgetSpp.year", cond: :like, searchable: true, orderable: true },
      month:       { source: "MonthlySpp.month",cond: :like, searchable: true, orderable: true },
      year_total:  { source: "PaymentDecorator.year_total", cond: :like, searchable: false, orderable: true },
      total:       { source: "PaymentDecorator.total", cond: :like, searchable: true, orderable: true },
      status:      { source: "PaymentDecorator.status", cond: :like, searchable: true, orderable: true },
      created_at:  { source: "Payment.created_at", cond: :like, searchable: true, orderable: true },
      updated_at:  { source: "Payment.updated_at", cond: :like, searchable: true, orderable: true },
      DT_RowId:    { cond: :null_value, searchable: false, orderable: false },
    }
  end

  def data
    records.map do |record|
      {
        name:       record.name,
        nis:        record.nis,
        admin_name: record[:admin_name],
        year:       record.year,
        year_total: record.decorate.year_total,
        total:      record.decorate.total,
        month:      record.month,
        status:     record.decorate.status,
        created_at: record.created_at,
        updated_at: record.updated_at,
        DT_RowId:   record.id,
      }
    end
  end

  def additional_data
    super.merge({
      dt_dropdown_data(:status) => select_options_for_status,
    })
  end

  def get_raw_records
      if params[:status].present?
        Payment.select(:'payments.id', :'students.name', :'students.nis', :'payments.status', :'monthly_spps.month', 
          :'monthly_spps.amount', :'payments.total', "admins.name AS admin_name", :'budget_spps.year',
           "SUM(monthly_spps.amount) AS year_total", :'payments.created_at', :'payments.updated_at')
           .joins(:admin, student: [generation: [budget_spps: :monthly_spps]])
          .where("budget_spps.year = ?", 5.years.ago.strftime("%Y")).where("payments.status = ?", params[:status])..where('payments.status = ?', 2).group("payments.id")group("payments.id")
      else
          Payment.select(:'payments.id', :'students.name', :'students.nis', :'payments.status', 
            :'payments.total', :'monthly_spps.month',:'monthly_spps.amount', "admins.name AS admin_name", :'budget_spps.year',
             "SUM(monthly_spps.amount) AS year_total", :'payments.created_at', :'payments.updated_at')
             .joins(:admin, student: [generation: [budget_spps: :monthly_spps]])
            .where("budget_spps.year = ?", 5.years.ago.strftime("%Y")).where('payments.status = ?', 2).group("payments.id")
      end
  end

  def records_total_count
    get_raw_records.length
  end
 
  def records_filtered_count
    filter_records(get_raw_records).length
  end

  private


    def filter_country_condition
      ->(column, value) { column.table[column.field].eq(column.search.value.to_i + 1) }
    end

  # Payment.select( "payments.id, students.name, students.nis, payments.status, 
  #   payments.total, admins.name AS admin_name, budget_spps.year, 
  #   sum(monthly_spps.amount) AS year_total, payments.created_at, payments.updated_at")
  #   .includes(:admin, students: [generation: [budget_spps: :monthly_spps]]).group("payments.id")
    
  # Payment.select("payments.id, students.name, students.nis, payments.status, 
  #   payments.total, admins.name AS admin_name, budget_spps.year, 
  #   sum(monthly_spps.amount) AS year_total, payments.created_at, payments.updated_at").includes({student: { generation: {budget_spps: :monthly_spps}}}).references(:students, :budget_spps, :generations, :monthly_spps)
  # Payment.includes(:students)
  

  # Payment.select("sum(monthly_spps.amount)").includes(student: [generation: [budget_spps: :monthly_spps]]).references(:student, :generation, :budget_spps, :monthly_spps).distinct
  # private


end
