class SearchesController < ApplicationController
  include PostsHelper

  before_action :search_params
  before_action :split_endpoints

  def index
    @posts = []
    results = Search.new(@search_input, @page).search_all

    results.each do |post|
      @posts << format_post(post)
    end

    render json: {
      posts: @posts
    }
  end

  private

  def search_params
    @search_input = params[:keywords]
  end
end
