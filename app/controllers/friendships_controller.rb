class FriendshipsController < ApplicationController
	def new
		@frienship = Frienship.build
	end 

	def create
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
		if @friendship.save
			flash[:notice] = "Added friend."
			redirect_to root_url
		else
			flash[:notice] = "Unable to add friend."
			redirect_to root_url
		end
	end

	def edit

    		@friendship = current_user.friendships.find(params[:id])
  	end


	def update
		@friendship = current_user.friendships.find(params[:id])
		@friendship.update_attributes(friendship_params)
		redirect_to current_user
		flash[:notice] = "Contact is updated."
	end

	def destroy
		 @friendship = current_user.friendships.find(params[:id])
  			@friendship.destroy
  		flash[:notice] = "Removed friendship."
  		redirect_to current_user
	end

  private 
  	def friendship_params
  		params.require(:friendship).permit(:name) 
  	end 
end
