class Admins::Admin::Categories::MajorsController < ApplicationController
  layout "admins/layouts/app"
  def index
    respond_to do |format|
      format.html
      format.json { render json: MajorDatatable.new(params) }
    end
  end

  def new 
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
