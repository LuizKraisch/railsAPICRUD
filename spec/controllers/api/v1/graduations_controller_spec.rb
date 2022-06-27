# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Api::V1::GraduationsController, type: :request do
  let!(:person) { create(:person) }
  let!(:graduations) { create_list(:graduation, 5, person: person) }

  describe '#GET /api/v1/o/:org_id/graduations' do
    it 'bring all graduations' do
      get api_v1_graduations_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#GET /api/v1/o/:org_id/graduations/:id' do
    it 'bring an especific graduation' do
      get api_v1_graduation_path(graduations.sample.id)
      expect(response).to have_http_status(:ok)
    end

    it 'throws error with invalid params' do
      get api_v1_graduatione_path(id: 'tralala')
      expect(response).to have_http_status(:not_found)
    end
  end

  describe '#POST /api/v1/o/:org_id/graduations/:id' do
    it 'creates a graduation' do
      put api_v1_graduations_path(), params: valid_params.to_json
      expect(response.status).to have_http_status(:created)
    end

    it 'throws error with invalid params' do
      put api_v1_graduations_path(), params: invalid_params.to_json
      expect(response.status).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#PUT /api/v1/o/:org_id/graduations/:id' do
    let!(:graduation) { graduations.sample }

    it 'updates a graduation' do
      graduation.title = 'Nome'
      put api_v1_graduation_path(graduation.id), params: graduation.to_json
      expect(response.status).to have_http_status(:ok)
    end

    it 'throws error with invalid params' do
      graduation.title = ''
      put api_v1_graduation_path(graduation.id), params: graduation.to_json
      expect(response.status).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#DELETE /api/v1/o/:org_id/graduations/:id' do
    it 'deletes graduation' do
      delete api_v1_graduation_path(graduation.sample.id)
      expect(response.status).to have_http_status(:no_content)
    end
  end

  describe 'mutation tests' do
    context 'when trying to load a non-existing graduation' do
      it 'returns an error' do
        post api_v1_graduation_path('not_found'), params: { id: 'not_found' }

        expect(response.status).to eq(:unprocessable_entity)
        expect(json_response).to eq({
          "error" => I18n.t('api.resource_not_found')
        })
      end
    end

    context 'when passing an argument other than an id' do
      it 'returns an error' do
        post api_v1_graduation_path(self), params: { id: 'not_found' }

        expect(response.status).to eq(:unprocessable_entity)
        expect(json_response).to eq({
          "error" => I18n.t('api.resource_not_found')
        })
      end
    end
  end

  private

  def valid_params
    params = { organization_id: organization.id, name: "Categoria" }
  end

  def invalid_params
    valid_params.delete(:name)
  end
end
