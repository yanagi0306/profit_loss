class CompaniesController < ApplicationController
 before_action :authenticate_company!
 before_action :signed_in_check
  def index

  end
  private
  def signed_in_check
    if stores_signed_in?
      redirect_to root_path
    end
  end
end
