# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Api::V1::EmployeesController, type: :request do
  let!(:person) { create(:person) }
  let!(:employee) { create(:employee, person: person) }

  describe '#GET /api/v1/o/:org_id/employees' do
    it 'bring all employees' do
      get api_v1_employees_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#GET /api/v1/o/:org_id/employees/:id' do
    it 'bring an especific employee' do
      get api_v1_employee_path(employees.sample.id)
      expect(response).to have_http_status(:ok)
    end

    it 'throws error with invalid params' do
      get api_v1_employee_path(id: 'tralala')
      expect(response).to have_http_status(:not_found)
    end
  end

  describe '#POST /api/v1/o/:org_id/employees/:id' do
    it 'creates a employee' do
      put api_v1_employees_path(), params: valid_params.to_json
      expect(response.status).to have_http_status(:created)
    end

    it 'throws error with invalid params' do
      put api_v1_employees_path(), params: invalid_params.to_json
      expect(response.status).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#PUT /api/v1/o/:org_id/employees/:id' do
    it 'updates a employee' do
      employee.name = 'Nome'
      put api_v1_employee_path(employee.id), params: employee.to_json
      expect(response.status).to have_http_status(:ok)
    end

    it 'throws error with invalid params' do
      employee.title = ''
      put api_v1_employee_path(employee.id), params: employee.to_json
      expect(response.status).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#DELETE /api/v1/o/:org_id/employees/:id' do
    it 'deletes employee' do
      delete api_v1_employee_path(employee.sample.id)
      expect(response.status).to have_http_status(:no_content)
    end
  end

  private

  def valid_params
    params = { person_id: person.id, area: "tecnologia", description: "descrição", payment_claim: 2500 }
  end

  def invalid_params
    valid_params.delete(:area)
  end
end
