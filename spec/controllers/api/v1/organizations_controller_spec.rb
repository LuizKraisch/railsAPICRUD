# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Api::V1::OrganizationsController, type: :request do
  let!(:organizations) { create_list(:organization, 5) }

  describe '#GET /api/v1/organizations' do
    it 'bring all organizations' do
      get api_v1_organizations_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#GET /api/v1/organizations/:id' do
    it 'bring an especific organization' do
      get api_v1_organization_path(organizations.sample.id)
      expect(response).to have_http_status(:ok)
    end

    it 'throws error with invalid params' do
      get api_v1_organization_path(id: 'tralala')
      expect(response).to have_http_status(:not_found)
    end
  end

  describe '#POST /api/v1/organizations/:id' do
    it 'creates a organization' do
      put api_v1_organization_path(), params: valid_params.to_json
      expect(response.status).to have_http_status(:created)
    end

    it 'throws error with invalid params' do
      put api_v1_organization_path(), params: invalid_params.to_json
      expect(response.status).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#PUT /api/v1/organizations/:id' do
    let!(:organization) { organizations.sample }

    it 'updates a organization' do
      organization.name = 'Nome Editado'
      put api_v1_organization_path(organization.id), params: organization.to_json
      expect(response.status).to have_http_status(:ok)
    end

    it 'throws error with invalid params' do
      organization.name = ''
      put api_v1_organization_path(organization.id), params: organization.to_json
      expect(response.status).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#DELETE /api/v1/organizations/:id' do
    it 'deletes organization' do
      delete api_v1_organization_path(organizations.sample.id)
      expect(response.status).to have_http_status(:no_content)
    end
  end

  describe 'mutation tests' do
    context 'when trying to load a non-existing organization' do
      it 'returns an error' do
        post api_v1_organization_path('not_found'), params: { id: 'not_found' }

        expect(response.status).to eq(:unprocessable_entity)
        expect(json_response).to eq({
          "error" => I18n.t('api.resource_not_found')
        })
      end
    end

    context 'when passing an argument other than an id' do
      it 'returns an error' do
        post api_v1_organization_path(self), params: { id: 'not_found' }

        expect(response.status).to eq(:unprocessable_entity)
        expect(json_response).to eq({
          "error" => I18n.t('api.resource_not_found')
        })
      end
    end
  end

  private

  def valid_params
    params = { name: 'Organização 2', cnpj: '123456789098', org_type: 'enterprise', num_employees: 168, area: 'food', city: 'Joinville', state: 'Santa Catarina' }
  end

  def invalid_params
    valid_params.delete(:name)
  end
end
