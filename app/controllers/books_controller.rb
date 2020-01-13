class BooksController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def index
  	@book = Book.new
  	@books = Book.all
  end

  def show
  	@book = Book.find(params[:id])
    @book_new = Book.new
    @comment = Comment.new
  end

  def edit
  	@book = Book.find(params[:id])
    @book_new = Book.new
  end

  def update
	 @book = Book.find(params[:id])
	  if @book.update(books_params)
      flash[:notice] = "successfully"
	    redirect_to book_path(@book)
    else
      @book_new = Book.new
      render :edit
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  def create
  	@book = Book.new(books_params)
  	@book.user = current_user
    if @book.save
  	redirect_to book_path(@book)#showページに飛ぶ
    flash[:notice] = "successfully"
  	else
  	@books = Book.all
  	render :index
  	end
  end



private
  def books_params
  	params.require(:book).permit(:title, :body)
  end
  def correct_user
    user = Book.find(params[:id]).user_id
    if current_user.id != user
    redirect_to books_path
    end
  end
end
