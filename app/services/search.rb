class Search
  attr_accessor :results, :search_input

  def initialize(search_input, page)
    return if search_input.nil?

    @page = page
    @results = []
    @search_input = search_input
  end

  def search_tags
    input = @search_input.split('_')

    Post.joins(:tags)
        .where('title ILIKE ANY ( ARRAY[?] )', input)
        .order('created_at DESC')
        .limit(10).offset((@page - 1) * 10)
        .each do |post|

      @results << post
    end
  end

  def search_languages
    input = @search_input.split('_')

    Post.joins(:snippets)
        .where('language ILIKE ANY ( ARRAY[?] )', input)
        .order('created_at DESC')
        .limit(10).offset((@page - 1) * 10)
        .each do |post|

      @results << post
    end
  end

  def search_username
    input = "%#{@search_input.split('-').join(' ')}%"

    Post.joins(:user)
        .where('username ILIKE ANY ( ARRAY[?] )', input)
        .order('created_at DESC')
        .limit(10).offset((@page - 1) * 10)
        .each do |post|

      @results << post
    end
  end

  def search_all
    search_tags
    search_languages
    search_username
  end
end
