class StaticPagesController < ApplicationController
	def root
		# raise
		if !user_signed_in?
			redirect_to new_user_session_path
			return
		end
		# use different render for different roles
		if current_user.has_role? :handy
			# show profile
			# anyway just show the profile now
			@profile = current_user.handy_profile
		else
			@profiles = HandyProfile.all
		end
		# if it is a user, redirect to handy people list
		if current_user.has_role? :user
			# redirect_to
		else
		end
		# if it is a handy, reidrect to profile.
	end
end
