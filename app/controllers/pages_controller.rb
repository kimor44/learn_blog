class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @number = 10
  end

  def test
    @test = "Ici une phrase"
  end

  def castor

  end
end
