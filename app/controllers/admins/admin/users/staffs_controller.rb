class Admins::Admin::Users::StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  layout "admins/layouts/app"
  def index
    respond_to do |format|
      format.html
      format.json { render json: StaffDatatable.new(params) }
    end
  end

  def new
    @staff = Admin.new
  end

  def show
  end

  def create
    @staff = Admin.new(staff_params)

    if @staff.save
      flash[:notice] = "Staff berhasil ditambahkan"
      redirect_to admins_admin_users_staffs_path
    else
      flash[:alert] = "Staff gagal ditambahkan"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if params[:password] == @staff.encrypted_password
      if @staff.update(staff_params.except(:password))
        flash[:notice] = "Staff berhasil diubah"
        redirect_to admins_admin_users_staffs_path
      else
        flash[:alert] = "Staff gagal diubah"
        render :edit
      end
    else
      if @staff.update(staff_params)
        flash[:notice] = "Staff berhasil diubah"
        redirect_to admins_admin_users_staffs_path
      else
        flash[:alert] = "Staff gagal diubah"
        render :edit
      end
    end
  end

  def destroy
    if @staff.destroy!
      flash[:notice] = "Staff berhasil dihapus"
      redirect_to admins_admin_users_staffs_path
    else
      flash[:alert] = "Staff gagal dihapus"
      redirect_to admins_admin_users_staffs_path
    end
  end

  private
  
  def set_staff
    @staff = Admin.where(roles: :staff).find(params[:id])
  end

  def staff_params
    params.require(:admin).permit(:name, :phone, :email, :address, :nip, :status, :photo, :password)
  end
end
