class Api::V1::PeopleController < ApplicationController
  before_action :set_person_in_organization, only: [ :show, :graduations, :update, :destroy ]

  def index
    @people = Person.where(organization_id: params[:organization_id]).all
  end

  def show; end

  def graduations; end

  def create
    @person = Person.new(person_params)

    if @person.save
      render json: @person, status: :created
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def update
    if @person.update(person_params)
      render json: @person, status: :ok
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @person.destroy
  end

  private

  def set_person_in_organization
    @person = Person.where(id: params[:id], organization_id: params[:organization_id]).first
    if @person.nil? then render :nothing => true, :status => :not_found else @person end
  end

  def person_params
    params.require(:person).permit(:organization_id, :first_name, :last_name, :age, :telephone, :city, :state, :country)
  end
end
