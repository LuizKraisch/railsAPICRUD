class Api::V1::OpportunitiesController < ApplicationController
  before_action :set_opportunity_in_organization, only: [ :show, :update, :destroy ]

  def index
    @opportunities = Opportunity.where(organization_id: params[:organization_id]).all
  end

  def show; end

  def create
    @opportunity = Opportunity.new(opportunity_params)

    if @opportunity.save
      render json: @opportunity, status: :created
    else
      render json: @opportunity.errors, status: :unprocessable_entity
    end
  end

  def update
    render json: @opportunity.errors, status: :unprocessable_entity unless @opportunity.update(opportunity_params)
  end

  def destroy
    @opportunity.destroy
    render status: :no_content
  end

  private

  def set_opportunity_in_organization
    @opportunity = Opportunity.where(id: params[:id], organization_id: params[:organization_id]).first
  end

  def opportunity_params
    params.require(:opportunity).permit(:title, :description, :initial_date, :salary)
  end
end
