class HomeController < ActionController::Base   
    def index
        @categories = Category.all
    end
end
