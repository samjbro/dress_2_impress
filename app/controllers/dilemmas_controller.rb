class DilemmasController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  def index
    @dilemmas = Dilemma.all
    @vote = Vote.new
  end

  def new
    @dilemma = Dilemma.new
  end

  def create
    @dilemma = current_user.dilemmas.new(dilemma_params)
    if @dilemma.save
      redirect_to '/dilemmas'
    else
      render 'new'
    end
  end

  def destroy
    @dilemma = Dilemma.find(params[:id])
    @dilemma.destroy
    flash[:notice] = 'Dilemma deleted'
    redirect_to "/users/#{current_user.id}"
  end

  def show
    @dilemma = Dilemma.find(params[:id])
    @vote1_count = @dilemma.votes.where(choice: '1').count
    @vote2_count = @dilemma.votes.where(choice: '2').count
    @vote1_proportions = 100 * ((@vote1_count+1.0)/(@vote2_count+1.0))
    @vote2_proportions = 100 * ((@vote2_count+1.0)/(@vote1_count+1.0))
  end

private

  def dilemma_params
    params.require(:dilemma).permit(:occasion, :option1, :option2)
  end
end
