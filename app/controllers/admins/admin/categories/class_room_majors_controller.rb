class Admins::Admin::Categories::ClassRoomMajorsController < ApplicationController
  layout "admins/layouts/app"
  before_action :get_class_room
  before_action :set_class_room_major, only: [:edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html
      format.json { render json: ClassRoomMajorDatatable.new(params) }
    end
  end

  def new
    @majors = Major.select('id', 'short').all
    @class_room_major = @class_room.class_room_majors.build
  end

  def create
    @class_room_major = @class_room.class_room_majors.build(class_room_major_params)
    if @class_room_major.save
      flash[:notice] = "Kelas jurusan berhasil ditambahkan"
      redirect_to admins_admin_categories_class_room_class_room_majors(@class_room)
    else
      flash[:alert] = "Kelas jurusan gagal ditambahkan"
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @majors = Major.select('id', 'short').all
  end

  def update
    if @class_room_major.update(class_room_major_params)
      flash[:notice] = "Kelas jurusan berhasil diubah"
      redirect_to admins_admin_categories_class_room_class_room_majors(@class_room)
    else
      flash[:alert] = "Kelas jurusan gagal diubah"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @class_room_major.destroy
      flash[:notice] = "Kelas jurusan berhasil dihapus"
      redirect_to admins_admin_categories_class_room_class_room_majors(@class_room)
    else
      flash[:alert] = "Kelas jurusan gagal dihapus"
      redirect_to admins_admin_categories_class_room_class_room_majors(@class_room)
    end
  end

  private

  def get_class_room
    @class_room = ClassRoom.find(params[:class_room_id])
  end

  def set_class_room_major
    @class_room_major = @class_room.class_room_majors.find(params[:id])
  end

  def class_room_major_params
    params.require(:class_room_major).permit(:name, :id_major)
  end
end
