class AuthorsController < ApplicationController

  before_filter :authorize

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
    @books = @author.books
  end
end