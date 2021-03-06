class CategoriesController < ApplicationController

    before_action :require_admin, except: [:index, :show]
    def create
        @category = Category.new  (category_params)
        if @category.save
            flash[:success] = "You have created a category" 
            redirect_to categories_path
        else
            render :new
        end
    end

    def new
        @category = Category.new
    end

    def show
    end

    def index
        @categories = Category.paginate(page: params[:page], per_page: 5)
    end

    private
    def category_params
        params.require(:category).permit(:name)
    end
end
