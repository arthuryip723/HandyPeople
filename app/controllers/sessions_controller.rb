class SessionsController < ApplicationController
	def create
		raise
	    super do |resource|
	      	BackgroundWorker.trigger(resource)
	    end
	end
end
