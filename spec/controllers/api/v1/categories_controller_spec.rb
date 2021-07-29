# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Api::V1::CategoriesController, type: :request do
  let!(:organization) { create(:organization) }
  let!(:categories) { create_list(:category, 5, organization: organization) }

  describe '#GET /api/v1/o/:org_id/categories' do
    it 'bring all categories' do
      get api_v1_categories_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#GET /api/v1/o/:org_id/categories/:id' do
    it 'bring an especific category' do
      get api_v1_category_path(categories.sample.id)
      expect(response).to have_http_status(:ok)
    end

    it 'throws error with invalid params' do
      get api_v1_category_path(id: 'tralala')
      expect(response).to have_http_status(:not_found)
    end
  end

  describe '#POST /api/v1/o/:org_id/categories/:id' do
    it 'creates a category' do
      put api_v1_categories_path(), params: valid_params.to_json
      expect(response.status).to have_http_status(:created)
    end

    it 'throws error with invalid params' do
      put api_v1_categories_path(), params: invalid_params.to_json
      expect(response.status).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#PUT /api/v1/o/:org_id/categories/:id' do
    let!(:category) { categories.sample }

    it 'updates a category' do
      category.name = 'Nome'
      put api_v1_category_path(category.id), params: category.to_json
      expect(response.status).to have_http_status(:ok)
    end

    it 'throws error with invalid params' do
      category.title = ''
      put api_v1_category_path(category.id), params: category.to_json
      expect(response.status).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#DELETE /api/v1/o/:org_id/categories/:id' do
    it 'deletes category' do
      delete api_v1_category_path(category.sample.id)
      expect(response.status).to have_http_status(:no_content)
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
