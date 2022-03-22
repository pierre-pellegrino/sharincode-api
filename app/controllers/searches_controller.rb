class SearchesController < ApplicationController
  include PostsHelper

  before_action :search_params
  before_action :split_endpoints

  def index
    @posts = []
    search = Search.new(@search_input)
    search.search_all

    search.results[((@page - 1) * 10)..(@page * 10 - 1)].each do |post|
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
