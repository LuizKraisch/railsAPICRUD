# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Api::V1::PeopleController, type: :request do
  let!(:organization) { create(:organization) }
  let!(:people) { create_list(:person, 5, organization: organization) }

  describe '#GET /api/v1/o/:org_id/people' do
    it 'bring all persons' do
      get api_v1_people_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#GET /api/v1/o/:org_id/people/:id' do
    it 'bring an especific person' do
      get api_v1_people_path(people.sample.id)
      expect(response).to have_http_status(:ok)
    end

    it 'throws error with invalid params' do
      get api_v1_people_path(id: 'tralala')
      expect(response).to have_http_status(:not_found)
    end
  end

  describe '#GET /api/v1/o/:org_id/people/:id/graduations' do
    it 'show the graduations of a person' do
      get graduations_api_v1_person(people.sample.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#POST /api/v1/o/:org_id/people/:id' do
    it 'creates a person' do
      put api_v1_people_path(), params: valid_params.to_json
      expect(response.status).to have_http_status(:created)
    end

    it 'throws error with invalid params' do
      put api_v1_people_path(), params: invalid_params.to_json
      expect(response.status).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#PUT /api/v1/o/:org_id/people/:id' do
    let!(:person) { people.sample }

    it 'updates a person' do
      person.first_name = 'Nome'
      put api_v1_people_path(person.id), params: person.to_json
      expect(response.status).to have_http_status(:ok)
    end

    it 'throws error with invalid params' do
      person.title = ''
      put api_v1_people_path(person.id), params: person.to_json
      expect(response.status).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#DELETE /api/v1/o/:org_id/people/:id' do
    it 'deletes person' do
      delete api_v1_people_path(person.sample.id)
      expect(response.status).to have_http_status(:no_content)
    end
  end

  describe 'mutation tests' do
    context 'when trying to load a non-existing person' do
      it 'returns an error' do
        post api_v1_people_path('not_found'), params: { id: 'not_found' }

        expect(response.status).to eq(:unprocessable_entity)
        expect(json_response).to eq({
          "error" => I18n.t('api.resource_not_found')
        })
      end
    end

    context 'when passing an argument other than an id' do
      it 'returns an error' do
        post api_v1_people_path(self), params: { id: 'not_found' }

        expect(response.status).to eq(:unprocessable_entity)
        expect(json_response).to eq({
          "error" => I18n.t('api.resource_not_found')
        })
      end
    end
  end

  private

  def valid_params
    params = { organization_id: organization.id, first_name: "Nome", last_name: "Sobrenome", age: 19, telephone: "47992654798", city: "Joinville", state: "SC", country: "Brasil" }
  end

  def invalid_params
    valid_params.delete(:first_name)
  end
end
