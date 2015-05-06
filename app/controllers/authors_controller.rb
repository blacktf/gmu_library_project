class AuthorsController < ApplicationController

  before_filter :authorize

  def index
    @authors = Author.all
  end
end