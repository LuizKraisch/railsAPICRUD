class Api::V1::OrganizationsController < ApplicationController
  before_action :set_organization, only: [ :show, :update, :destroy ]

  def index
    @organizations = Organization.order(name: :asc).all
  end

  def show; end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      render json: @organization, status: :created
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  def update
    render json: @organization.errors, status: :unprocessable_entity unless @organization.update(organization_params)
  end

  def destroy
    @organization.destroy
    render status: :no_content
  end

  private

  def set_organization
    @organization = Organization.where(id: params[:id]).first
  end

  def organization_params
    params.require(:organization).permit(:name, :cnpj, :org_type, :num_employees, :area, :city, :state)
  end
end
