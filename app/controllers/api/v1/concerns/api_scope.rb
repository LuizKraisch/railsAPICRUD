module Api::V1::Concerns::ApiScope
  extend ActiveSupport::Concern
  include Rails::Pagination

  included do
    rescue_from ActiveRecord::RecordNotFound, :with => :not_found
    respond_to :json
  end
end