module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_resource
  end

  protected

  def check_resource
    if admin_signed_in?
      if current_admin.admin?
        flash.clear
        redirect_to(admins_admin_authenticated_root_path) and return
      elsif current_admin.staff?
        flash.clear
        redirect_to(admins_staff_authenticated_root_path) and return
      end
    elsif student_signed_in?
      flash.clear
      redirect_to(students_authenticated_root_path) and return
    end
  end
end