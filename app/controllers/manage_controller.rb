class ManageController < ApplicationController
  before_action :authenticate_user!, :is_admin?

  def index
  end
  
  def first_page
    @first_pages = FirstPage.all
  end

  def new_first_page
    @first_page = FirstPage.new
  end

  def create_first_page
    FirstPage.create!(first_page_params)
    redirect_to manage_first_page_path
  end

  private

  def first_page_params
    params.require(:first_page).permit(:title)
  end
end
