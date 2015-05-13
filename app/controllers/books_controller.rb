class BooksController < ApplicationController

  before_action :set_book, only: [:reserve, :show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json

  before_filter :authorize

  def reserve

  end

  def index

    if params[:search]

      #@books = Book.search(params[:search]).order("created_at DESC").page(params[:page])
      @books = Book.joins(:author).where("title like ? OR isbn like ? OR authors.name like ?",
       "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
      .order("created_at DESC").page(params[:page])
      @page_title = 'Search Results'
    else
      @books = Book.order(:title).page(params[:page])
      @page_title = 'All Books'
    end

  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    if @current_user.admin
      @book = Book.new
      @authors = Author.all
    else
      redirect_to @books
    end
  end

  # GET /books/1/edit
  def edit
    if @current_user.admin
      @authors = Author.all
    else
      redirect_to @book
    end
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    if @current_user.admin
      @book.destroy
      respond_to do |format|
        format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to @book
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      #params[:book]
       params.require(:book).permit(:isbn,:title,:genre, :email,:abstract, :pages,
        :image_cover_url,:published_on, :total_in_library, :author,:author_id)

    end
end
