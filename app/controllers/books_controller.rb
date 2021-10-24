class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully updated."
    # showに戻る
     redirect_to book_path(@book.id)
    else
     render :index
    end

  end

  def edit
    @book = Book.find(params[:id])
  end

　def destroy
　  book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
　end

　def update
　  @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book)
    else
      render :edit
　  end
　end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
