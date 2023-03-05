class Admins::Admin::Users::StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  layout "admins/layouts/app"
  def index
    respond_to do |format|
      format.html
      format.json { render json: StudentDatatable.new(params) }
    end
  end

  def new
    @student = Student.new
    @class_room_majors = ClassRoomMajor.includes(:major).all.pluck("class_room_majors.id", "class_room_majors.name", "majors.short")
  end

  def create
    @student = Student.new(student_params.merge(password: student_params[:nisn]))

    if @student.save
      flash[:notice] = "Siswa berhasil ditambahkan"
      redirect_to admins_admin_users_students_path
    else
      flash[:alert] = "Siswa gagal ditambahkan"
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    @class_room_majors = ClassRoomMajor.includes(:major).all.pluck("class_room_majors.id", "class_room_majors.name", "majors.short")
  end

  def update
    if @student.update(student_params.merge(password: student_params[:nisn]))
      flash[:notice] = "Siswa berhasil diubah"
      redirect_to admins_admin_users_students_path
    else
      flash[:alert] = "Siswa gagal diubah"
      render :edit
    end
  end

  def destroy
    if @student.destroy!
      flash[:notice] = "Siswa berhasil dihapus"
      redirect_to admins_admin_users_students_path
    else
      flash[:alert] = "Siswa gagal dihapus"
      redirect_to admins_admin_users_students_path
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(
      :name, :nisn, :nis, :generation_id, :status,
      :class_room_major_id, :address, :email, :phone, :photo)
  end
end