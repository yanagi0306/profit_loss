class StoresController < ApplicationController
  before_action :check, only: [:index]
  def index; end

  private

  def check
    unless store_signed_in? || company_signed_in?
      redirect_to new_store_session_path
    end
  end
end
