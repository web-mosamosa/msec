class ResidencesController < ApplicationController


  def index
  	@residence = Residence.new
  	@residences = Residence.all
  end

  def edit
  	@residence = Residence.find(params[:id])
  end

  def create
  	@residence = Residence.new(residence_params)
    @residence.user_id = current_user.id
  	if @residence.save
  		redirect_to residences_path
  	else
  		@residences = Residence.all
  		render 'index'
  	end
  end

  def update
  	residence = Residence.find(params[:id])
  	if residence.update(residence_params)
  		redirect_to residences_path
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

