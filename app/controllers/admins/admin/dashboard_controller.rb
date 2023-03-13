class Admins::Admin::DashboardController < ApplicationController
  layout "admins/layouts/app"
  def index
    @date = DateTime.current

    @students = Student.where(status: :active).count(:all)
    @alumni_students = Student.where(status: :inactive).count(:all)
    @staffs = Admin.where(roles: :staff).count(:all)
    @payments = Payment.joins(:student).where("students.status = ?", :active).where("payments.status != ?", :completed).count(:all)
    @majors = Major.count(:all)
    @has_payments = Payment.joins(:student).where(status: :active).where(status: :completed).count(:all)
    @not_payments = Payment.joins(:student).where(status: :active).where(status: :initial).count(:all)
    @arrears_payments = Payment.joins(:student).where(status: :active).where(status: :arrears).count(:all)
    @generations = Generation.count(:all)
    
    # Jumlah Bayar SPP Per 7 tahun dengan tahun sekarang
    @spp_now_year = BudgetSpp.joins(:monthly_spps).where(budget_spps: { year: @date.strftime("%Y")} ).sum(:amount)
    @spp_1_year = BudgetSpp.joins(:monthly_spps).where(budget_spps: { year: 1.years.ago.strftime("%Y")} ).sum(:amount)
    @spp_2_year = BudgetSpp.joins(:monthly_spps).where(budget_spps: { year: 2.years.ago.strftime("%Y")} ).sum(:amount)
    @spp_3_year = BudgetSpp.joins(:monthly_spps).where(budget_spps: { year: 3.years.ago.strftime("%Y")} ).sum(:amount)
    @spp_4_year = BudgetSpp.joins(:monthly_spps).where(budget_spps: { year: 4.years.ago.strftime("%Y")} ).sum(:amount)
    @spp_5_year = BudgetSpp.joins(:monthly_spps).where(budget_spps: { year: 5.years.ago.strftime("%Y")} ).sum(:amount)
    @spp_6_year = BudgetSpp.joins(:monthly_spps).where(budget_spps: { year: 6.years.ago.strftime("%Y")} ).sum(:amount)

    # Jumlah Siswa yang bayar dan yang belum per bulan ditahun sekarang

    # sudah bayar
    @spp_1_month_payed = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "January").where("payments.status = ?", 2).count(:all)
    @spp_2_month_payed = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "February").where("payments.status = ?", 2).count(:all)
    @spp_3_month_payed = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "March").where("payments.status = ?", 2).count(:all)
    @spp_4_month_payed = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "April").where("payments.status = ?", 2).count(:all)
    @spp_5_month_payed = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "May").where("payments.status = ?", 2).count(:all)
    @spp_6_month_payed = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "Juni").where("payments.status = ?", 2).count(:all)
    @spp_7_month_payed = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "July").where("payments.status = ?", 2).count(:all)
    @spp_8_month_payed = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "August").where("payments.status = ?", 2).count(:all)
    @spp_9_month_payed = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "September").where("payments.status = ?", 2).count(:all)
    @spp_10_month_payed = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "October").where("payments.status = ?", 2).count(:all)
    @spp_11_month_payed = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "November").where("payments.status = ?", 2).count(:all)
    @spp_12_month_payed = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "December").where("payments.status = ?", 2).count(:all)

    # belum bayar
    @spp_1_month_not = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "January").where("payments.status != ?", 2).count(:all)
    @spp_2_month_not = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "February").where("payments.status != ?", 2).count(:all)
    @spp_3_month_not = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "March").where("payments.status != ?", 2).count(:all)
    @spp_4_month_not = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "April").where("payments.status != ?", 2).count(:all)
    @spp_5_month_not = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "May").where("payments.status != ?", 2).count(:all)
    @spp_6_month_not = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "Juni").where("payments.status != ?", 2).count(:all)
    @spp_7_month_not = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "July").where("payments.status != ?", 2).count(:all)
    @spp_8_month_not = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "August").where("payments.status != ?", 2).count(:all)
    @spp_9_month_not = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "September").where("payments.status != ?", 2).count(:all)
    @spp_10_month_not = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "October").where("payments.status != ?", 2).count(:all)
    @spp_11_month_not = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "November").where("payments.status != ?", 2).count(:all)
    @spp_12_month_not = Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("students.status = ?", :active).where("budget_spps.year = ?", @date.strftime("%Y")).where("monthly_spps.month = ?", "December").where("payments.status != ?", 2).count(:all)


    @latest_transactions = Payment.select(:'payments.id', :'students.name', :'students.nis', :'payments.status', 
      :'payments.total', "admins.name AS admin_name", :'budget_spps.year',
       "SUM(monthly_spps.amount) AS year_total", :'payments.created_at', :'payments.updated_at')
       .joins(:admin, student: [generation: [budget_spps: :monthly_spps]])
      .where("budget_spps.year = ?", 5.years.ago.strftime("%Y")).group("payments.id").order("payments.created_at").limit(10)
  end
end

# Student.joins(generation: [budget_spps: :monthly_spps ]).where("budget_spps.generation_id = generations.id").where("monthly_spps.budget_spp_id = budget_spps.id").where("budget_spps.year = ?", 5.years.ago.
#   strftime("%Y")).count(:all)

# Student.joins(generation: [Budget_spps: :monthly_spps])
#       .where("budget_spps.year = ?", 5.years.ago.strftime("%Y"))
#       .where("")
# Payment.joins(student: [generation: [budget_spps: :monthly_spps ]] ).where("budget_spps.year = ?", 5.years.ago.strftime("%Y")).where("monthly_spps.month = ?", 5.years.ago.strftime("%B")).where("payments.status = ?", 2)

#  Student.joins(:payments, [generation: [budget_spps: :monthly_spps]] ).where("budget_spps.year = ?", @date.strftime("%Y")).where("budget_spps.month = ?", @date.strftime("%B")).where("payments.status = ?", 2)

# get data siswa anu encan mayar di bulan bulan saacanna
# get data siswa anu udah mayar di bulan bulan saacanna