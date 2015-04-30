class AuthorsController < ApplicationController
  def index
    @available_at = Time.now
    @authors = ["Mike Smith", "Jame Smith", "Jame Smith", "Jame Smith"]
  end
end