class Api::V1::CategoriesController < ApplicationController
  before_action :set_category_in_organization, only: [ :show, :update, :destroy ]

  def index
    @categories = Category.where(organization_id: params[:organization_id]).all
  end

  def show; end

  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      render json: @category, status: :ok
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
  end

  private

  def set_category_in_organization
    @category = Category.where(id: params[:id], organization_id: params[:organization_id]).first
  end

  def category_params
    params.require(:category).permit(:name, :organization_id)
  end
end
