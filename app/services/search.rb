class Search
  attr_accessor :results, :search_input, :raw_results

  def initialize(search_input)
    return if search_input.nil?

    @results = []
    @raw_results = []
    @search_input = []
    search_input.split('_').each do |input|
      @search_input << "%#{input}%"
    end
  end

  def search_tags
    Post.joins(:tags)
        .where('title ILIKE ANY ( ARRAY[?] )', @search_input)
        .order('created_at DESC')
        .each do |post|

      @raw_results << post
    end
  end

  def search_languages
    Post.joins(:snippets)
        .where('language ILIKE ANY ( ARRAY[?] )', @search_input)
        .order('created_at DESC')
        .each do |post|

      @raw_results << post
    end
  end

  def search_username
    Post.joins(:user)
        .where('username ILIKE ANY ( ARRAY[?] )', @search_input)
        .order('created_at DESC')
        .each do |post|

      @raw_results << post
    end
  end

  def relevance_sort
    @raw_results.group_by { |element| element }.map { |key, value| [key, value.size] }.each do |post|
      @results << post[0]
    end
  end

  def search_all
    search_tags
    search_languages
    search_username

    relevance_sort
  end
end
