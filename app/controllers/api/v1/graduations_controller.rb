class Api::V1::GraduationsController < ApplicationController
  before_action :set_graduation, only: [ :show ]

  def index
    @graduations = Graduation.all
  end

  def show; end

  def create
    @graduation = Graduation.new(graduation_params)

    if @graduation.save
      render json: @graduation, status: :created
    else
      render json: @graduation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @graduation.update(graduation_params)
      render json: @graduation, status: :ok
    else
      render json: @graduation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @graduation.destroy
  end

  private

  def set_graduation
    @graduation = Graduation.where(id: params[:id]).first
  end

  def graduation_params
    params.require(:graduation).permit(:person_id, :title, :description)
  end
end
