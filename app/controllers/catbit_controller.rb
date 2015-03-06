class CatbitController < ApplicationController
	def index
	end
	def show
	@catbit = Fitbit.find(params[:id])
	end
	def new
	end
	def edit
	end
	def create
	end
	def update
	# needs to be integrated with the FitBit data
    #@calories = fitbit
	#@steps = fitbit
	#@distance = fitbit
	end
	def destroy
	end
end
	
