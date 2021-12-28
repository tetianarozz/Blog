class PagesController < ApplicationController
  def index
    @name = params[:name]
  end

  def home; end

end
