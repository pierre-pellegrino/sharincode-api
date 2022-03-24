class ReactionsController < ApplicationController
  include ReactionsHelper

  def index
    @reactions = Reaction.all
    render_reactions
  end
end
