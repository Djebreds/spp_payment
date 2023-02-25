class Admins::Admin::Users::AdminsController < ApplicationController
  layout "admins/layouts/app"
  def index
    respond_to do |format|
      format.html
      format.json { render json: AdminDatatable.new(params) }
    end
  end

  def edit
  end
end
