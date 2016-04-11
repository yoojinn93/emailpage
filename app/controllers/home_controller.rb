class HomeController < ApplicationController
  def index
  end

  def success
    @emailfrom_ = params[:emailfrom]
    @emailto_ = params[:emailto]
    @title_ = params[:title]
    @content_ = params[:content]
  end
end
