class SearchController < ApplicationController
  def index
    @uploads = Upload.all
  end
end
