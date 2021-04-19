class Admin::ClassificationsController < ApplicationController
  
  def index
    @classification = Classification.new
    @classifications = Classification.all
  end
  
  def create
    @classification = Classification.new(classification_params)
    @classification.save(classification_params)
    redirect_to admin_classifications_path
  end
  
  def update
    @classification = Classification.find(params[:id])
    @classification.update(classification_params)
    redirect_to admin_classifications_path
  end
  
  def destroy
    @classification = Classification.find(params[:id])
    @classification.destroy
    redirect_to admin_classifications_path
  end
  
  private
  
  def classification_params
    params.require(:classification).permit(:name, :created_at, :updated_at)
  end
  
end

