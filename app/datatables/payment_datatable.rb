class PaymentDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      name:        { source: "Student.name", cond: :like, searchable: true, orderable: true },
      nis:         { source: "Student.nis", cond: :like, searchable: true, orderable: true },
      admin_name:  { source: "Admin.name", cond: :like, searchable: true, orderable: true },
      year:        { source: "BudgetSpp.year", cond: :like, searchable: true, orderable: true },
      year_total:  { source: "PaymentDecorator.year_total", cond: :like, searchable: false, orderable: true },
      total:       { source: "PaymentDecorator.total", cond: :like, searchable: true, orderable: true },
      status:      { source: "PaymentDecorator.status", cond: :like, searchable: true, orderable: true },
      created_at:  { source: "Payment.created_at", cond: :like, searchable: true, orderable: true },
      updated_at:  { source: "Payment.updated_at", cond: :like, searchable: true, orderable: true },
      DT_RowId:    { cond: :null_value, searchable: false, orderable: false },
      DT_actions:  { source: "PaymentDecorator.DT_actions", searchable: false },
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
        status:     record.decorate.status,
        created_at: record.created_at,
        updated_at: record.updated_at,
        DT_RowId:   record.id,
        DT_actions: record.decorate.DT_actions
      }
    end
  end


  def get_raw_records
      Payment.select(:'payments.id', :'students.name', :'students.nis', :'payments.status', 
      :'payments.total', "admins.name AS admin_name", :'budget_spps.year',
       "SUM(monthly_spps.amount) AS year_total", :'payments.created_at', :'payments.updated_at')
       .joins(:admin, student: [generation: [budget_spps: :monthly_spps]])
      .where("budget_spps.year = ?", 5.years.ago.strftime("%Y")).group("payments.id")
  end

  def records_total_count
    get_raw_records.length
  end
 
  def records_filtered_count
    filter_records(get_raw_records).length
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
