class SnippetsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy || error_formatter(@snippet) && return
    message = 'Snippet successfully deleted !'
    status = :accepted
    success_request(message, status)
  end
end
