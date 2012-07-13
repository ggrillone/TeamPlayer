class UsersController < ApplicationController

	def index
		@users = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new
		if @user.save
			# redirect
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end
end
