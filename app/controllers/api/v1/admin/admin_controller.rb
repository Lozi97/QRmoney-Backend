class Api::V1::Admin::AdminController < ApplicationController
  before_action :require_admin

  def require_admin
    unless current_user.admin?
      render json: { error: 'Not Authorized' }, status: 401
    end
  end
end
