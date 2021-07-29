# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Api::V1::OpportunitiesController, type: :request do
  let!(:organization) { create(:organization) }
  let!(:opportunities) { create_list(:opportunity, 5, organization: organization) }

  describe '#GET /api/v1/o/:org_id/opportunities' do
    it 'bring all opportunities' do
      get api_v1_opportunities_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#GET /api/v1/o/:org_id/opportunities/:id' do
    it 'bring an especific opportunity' do
      get api_v1_opportunity_path(opportunities.sample.id)
      expect(response).to have_http_status(:ok)
    end

    it 'throws error with invalid params' do
      get api_v1_opportunity_path(id: 'tralala')
      expect(response).to have_http_status(:not_found)
    end
  end

  describe '#POST /api/v1/o/:org_id/opportunities/:id' do
    it 'creates a opportunity' do
      put api_v1_opportunity_path(), params: valid_params.to_json
      expect(response.status).to have_http_status(:created)
    end

    it 'throws error with invalid params' do
      put api_v1_opportunity_path(), params: invalid_params.to_json
      expect(response.status).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#PUT /api/v1/o/:org_id/opportunities/:id' do
    let!(:opportunity) { opportunities.sample }

    it 'updates a opportunity' do
      opportunity.title = 'Nome Editado'
      put api_v1_opportunity_path(opportunity.id), params: opportunity.to_json
      expect(response.status).to have_http_status(:ok)
    end

    it 'throws error with invalid params' do
      opportunity.title = ''
      put api_v1_opportunity_path(opportunity.id), params: opportunity.to_json
      expect(response.status).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#DELETE /api/v1/o/:org_id/opportunities/:id' do
    it 'deletes opportunity' do
      delete api_v1_opportunity_path(opportunity.sample.id)
      expect(response.status).to have_http_status(:no_content)
    end
  end

  private

  def valid_params
    params = { organization_id: organization.id, title: "Oportunidade", description: "Incrível", initial_date: Date.today, salary: "2500,00" }
  end

  def invalid_params
    valid_params.delete(:title)
  end
end
