class AuthorsController < ApplicationController

  before_filter :authorize

  def index
  	@authors = Author.order(:name).page(params[:page])
  end

  def show
    @author = Author.find(params[:id])
    @books = @author.books
  end
end
