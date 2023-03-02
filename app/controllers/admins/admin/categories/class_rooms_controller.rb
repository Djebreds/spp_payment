class Admins::Admin::Categories::ClassRoomsController < ApplicationController
  before_action :set_class_room, only: [:edit, :update, :destroy]
  layout "admins/layouts/app"
  def index
    respond_to do |format|
      format.html
      format.json { render json: ClassRoomDatatable.new(params) }
    end
  end

  def new
    @class_room = ClassRoom.new
  end

  def create
    @class_room = ClassRoom.new(class_room_params)
    
    if @class_room.save
      flash[:notice] = "Kelas berhasil ditambahkan"
      redirect_to admins_admin_categories_class_rooms_path
    else
      flas[:alert] = "Kelas gagal ditambahkan"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @class_room.update(class_room_params)
      flash[:notice] = "Kelas berhasil diubah"
      redirect_to admins_admin_categories_class_rooms_path
    else
      flash[:alert] = "Kelas gagal diubah"
      render :edit
    end
  end

  def destroy
    if @class_room.destroy!
      flash[:notice] = "Kelas berhasil dihapus"
      redirect_to admins_admin_categories_class_rooms_path

    else
      flash[:alert] = "Kelas gagal dihapus"
      redirect_to admins_admin_categories_class_rooms_path
    end
  end

  private

  def set_class_room
    @class_room = ClassRoom.find(params[:id])
  end

  def class_room_params
    params.require(:class_room).permit(:name)
  end


end
