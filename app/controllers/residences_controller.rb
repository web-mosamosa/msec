class ResidencesController < ApplicationController


  def edit
  	@residence = Residence.find(params[:id])
  end

  def create
  	@residence = Residence.new(residence_params)
     @residence.user_id = current_user.id
  	if @residence.save
  		redirect_to user_residence_path(current_user)
  	else
  		@residences = Residence.all
  		user_residence_path(current_user)
  	end
  end

  def update
  	residence = Residence.find(params[:id])
  	if residence.update(residence_params)
  		redirect_to user_residence_path(current_user)
  	else
  		render 'edit'
  	end
  	
  end

  def destroy
  	residence = Residence.find(params[:id])
  	residence.destroy
  	redirect_to residences_path
  end

private
def residence_params
	params.require(:residence).permit(:postcode,:address,:name)
end



end

