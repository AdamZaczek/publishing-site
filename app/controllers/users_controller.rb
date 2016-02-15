class UsersController < ApplicationController
	skip_before_action :require_login, only: [:index, :new, :create]
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		#we dont wanna have show action atm
	end

	def create
		@user = User.new(user_params)

		if @user.save
  		redirect_to(:users, notice: 'User was successfully created')
		else
			render 'new'
		end
	end
    
    def edit
      @user = User.find(params[:id])
    end
    
    def update
      @user = User.find(params[:id])
      
      if @user.update_attributes(user_params)
        redirect_to @user
      else
        render 'edit'
      end
    end
    
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end
    
    
	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end