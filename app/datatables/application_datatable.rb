class ApplicationDatatable < AjaxDatatablesRails::ActiveRecord
  private
  def dt_dropdown_data(name)
    "dt_filter_data_#{column_id(name)}".to_sym
  end


  def select_options_for_status
    Payment.all.map { |k| { value: k.status, label: k.status } }
  end

end