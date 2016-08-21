class HandyProfilesController < ApplicationController
	def index
		@profiles = HandyProfile.all
	end

	def show
		@profile = HandyProfile.find(params[:id])
		# I wanna show and be able to book an appointment with this man
	end

	def update
		@profile = current_user.handy_profile
		if @profile.update(handy_profile_params)
			redirect_to root_path
		end
	end

	private
	def handy_profile_params
		params.require(:handy_profile).permit(:description)
	end
end
