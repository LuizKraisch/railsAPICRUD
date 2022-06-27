# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Api::V1::RecruitersController, type: :request do
  let!(:person) { create(:person) }
  let!(:organization) { create(:organization) }
  let!(:recruiter) { create(:recruiter, person: person, organization: organization) }

  describe '#GET /api/v1/o/:org_id/recruiters' do
    it 'bring all recruiters' do
      get api_v1_recruiters_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#GET /api/v1/o/:org_id/recruiters/:id' do
    it 'bring an especific recruiter' do
      get api_v1_recruiter_path(recruiters.sample.id)
      expect(response).to have_http_status(:ok)
    end

    it 'throws error with invalid params' do
      get api_v1_recruiter_path(id: 'tralala')
      expect(response).to have_http_status(:not_found)
    end
  end

  describe '#POST /api/v1/o/:org_id/recruiters/:id' do
    it 'creates a recruiter' do
      put api_v1_recruiters_path(), params: valid_params.to_json
      expect(response.status).to have_http_status(:created)
    end

    it 'throws error with invalid params' do
      put api_v1_recruiters_path(), params: invalid_params.to_json
      expect(response.status).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#PUT /api/v1/o/:org_id/recruiters/:id' do
    it 'updates a recruiter' do
      recruiter.name = 'Nome'
      put api_v1_recruiter_path(recruiter.id), params: recruiter.to_json
      expect(response.status).to have_http_status(:ok)
    end

    it 'throws error with invalid params' do
      recruiter.title = ''
      put api_v1_recruiter_path(recruiter.id), params: recruiter.to_json
      expect(response.status).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#DELETE /api/v1/o/:org_id/recruiters/:id' do
    it 'deletes recruiter' do
      delete api_v1_recruiter_path(recruiter.sample.id)
      expect(response.status).to have_http_status(:no_content)
    end
  end

  describe 'mutation tests' do
    context 'when trying to load a non-existing recruiter' do
      it 'returns an error' do
        post api_v1_recruiter_path('not_found'), params: { id: 'not_found' }

        expect(response.status).to eq(:unprocessable_entity)
        expect(json_response).to eq({
          "error" => I18n.t('api.resource_not_found')
        })
      end
    end

    context 'when passing an argument other than an id' do
      it 'returns an error' do
        post api_v1_recruiter_path(self), params: { id: 'not_found' }

        expect(response.status).to eq(:unprocessable_entity)
        expect(json_response).to eq({
          "error" => I18n.t('api.resource_not_found')
        })
      end
    end
  end

  private

  def valid_params
    params = { person_id: person.id, organization_id: organization.id, area: "Tecnologia", description: "Descrição" }
  end

  def invalid_params
    valid_params.delete(:area)
  end
end
