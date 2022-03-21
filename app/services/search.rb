class Search
  attr_accessor :results, :search_input

  def initialize(search_input)
    return if search_input.nil?

    @results = []
    @search_input = search_input.split('_')
  end

  def search_tags
    Post.joins(:tags).where('title ILIKE ANY ( ARRAY[?] )', @search_input).each do |post|
      @results << post
    end
  end

  def search_all
    search_tags

    @results
  end
end
