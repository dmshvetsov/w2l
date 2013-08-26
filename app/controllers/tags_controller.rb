class TagsController < ApplicationController
  def index
    @tags = Tag.first(100)
  end
end
