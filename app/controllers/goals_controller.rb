class GoalsController < ApplicationController
  def new
  	@goal = Goal.new
  end

  def show
  	@goal = current_user.goals.find params[:id] 
  end

  def index
  	@goal = current_user.goals.all
  end

  def create
    @goal = Goal.create(goal_params)

    if @goal.save
      redirect_to goals_path
    else
      render "new"
    end 
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    @goals = Goal.all

    respond_to do |format|
      format.html { redirect_to goals_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def edit
    @goal = @goals = current_user.goals
  end

  def update
    @goal = Goal.find(params[:id])

    if @goal.update_attributes(goal_params)
      redirect_to @goal
    else
      render 'edit'
    end
  end

  def complete
    @goal = Goal.find(params[:id])
    @goal.update_attributes(complited: true) 
    redirect_to goal_path
  end

  def active_again
    @goal = Goal.find(params[:id])
    @goal.update_attributes(complited: false) 
    redirect_to goal_path
  end

  private

  def goal_params
    params.require(:goal).permit(:user_id, :title, :description, :priority, :complited, :due_date)
	end
end
