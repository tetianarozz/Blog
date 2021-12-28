class PagesController < ApplicationController
  def index
    @name = params[:name]
  end

  def pattern; end

end
