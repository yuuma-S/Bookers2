class FavoritesController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    # こう記述することで、「current_userに関連したFavoriteクラスの新しいインスタンス」が作成可能。
    # つまり、favorite.user_id = current_user.idが済んだ状態で生成されている。
    # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
    current_user.favorites.create(book_id: params[:book_id])

  end

  def destroy
    @book = Book.find(params[:book_id])

    favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
    favorite.destroy

  end
end
