class SearchesController < ApplicationController
  def search
  	#Viewのformで取得したパラメータをモデルに渡す
  	@users = User.all
  	@books = Book.all
  	@sort = params[:sort]
  	@model = params[:model]
  	@input = params[:search]
  	@result = searching(@input, @model, @sort)
  end
  def searching(input, model, sort)

  	if	model == "user"
  		if sort == "1"
			User.where('name LIKE ?',"%#{input}%")
		elsif sort == "2"
			User.where(name: input)
		elsif sort == "3"
			User.where('name LIKE ?',"#{input}%")
		elsif sort == "4"
			User.where('name LIKE ?',"%#{input}")
  		end
  	elsif model == "book"
  		if sort == "1"
			Book.where('title LIKE ?',"%#{input}%")
		elsif sort == "2"
			Book.where(title: input)
		elsif sort == "3"
			Book.where('title LIKE ?',"#{input}%")
		elsif sort == "4"
			Book.where('title LIKE ?',"%#{input}")
		end

  	end

  end
end
