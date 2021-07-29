class Api::V1::RecruitersController < ApplicationController
  before_action :set_recruiter_in_organization, only: [ :show, :update, :destroy ]

  def index
    @recruiters = Recruiter.all
  end

  def show; end

  def create
    @recruiter = Recruiter.new(recruiter_params)

    if @recruiter.save
      render json: @recruiter, status: :created
    else
      render json: @recruiter.errors, status: :unprocessable_entity
    end
  end

  def update
    if @recruiter.update(recruiter_params)
      render json: @recruiter, status: :ok
    else
      render json: @recruiter.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @recruiter.destroy
  end

  private

  def set_recruiter_in_organization
    @recruiter = Recruiter.where(id: params[:id], organization_id: params[:organization_id]).first
  end

  def recruiter_params
    params.require(:recruiter).permit(:person_id, :organization_id, :area, :description)
  end
end
