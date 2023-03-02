class Admins::Admin::Categories::MajorsController < ApplicationController
  before_action :set_major, only: [:edit, :update, :destroy]
  layout "admins/layouts/app"
  def index
    respond_to do |format|
      format.html
      format.json { render json: MajorDatatable.new(params) }
    end
  end

  def new 
    @major = Major.new
  end

  def create
    @major = Major.new(major_params)

    if @major.save
      redirect_to admins_admin_categories_majors_path, notice: 'Jurusan berhasil ditambahkan'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    if @major.update(major_params)
      redirect_to admins_admin_categories_majors_path, notice: 'Jurusan berhasil diubah'
    else
      render :edit
    end
  end

  def destroy
    @major.destroy!

    redirect_to admins_admin_categories_majors_path, notice: 'Jurusan berhasil dihapus'
  end

  private
  def set_major
    @major = Major.find(params[:id])
  end

  def major_params
    params.require(:major).permit(:name, :short)
  end

end
