class SearchesController < ApplicationController
  before_action :search_params

  def index
    @posts = []
    search = Search.new(@search_input).search_all

    search.each do |result|
      @posts << result
    end

    render json: {
      posts: @posts
    }
  end

  private

  def search_params
    @search_input = params[:all]
  end
end
