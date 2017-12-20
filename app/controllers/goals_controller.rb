class GoalsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def new
  	@goal = Goal.new
  end

  def show
  	@goal = current_user.goals.find params[:id] 
  end

  def index
  	@goal = current_user.goals.order(sort_column + ' ' + sort_direction).where(complited: false) 
    @goal_completed = current_user.goals.order(sort_column + ' ' + sort_direction).where(complited: true) 
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
    @goal = current_user.goals.find params[:id]
  end

  def update
    @goal = Goal.find(params[:id])

    if @goal.update_attributes(goal_params)
      redirect_to goals_path
    else
      render 'edit'
    end
  end

  def complete
    @goal = Goal.find(params[:id])
    @goal.update_attributes(complited: true) 
    redirect_to goals_path
  end

  def active_again
    @goal = Goal.find(params[:id])
    @goal.update_attributes(complited: false) 
    redirect_to goals_path
  end

  private

    def sort_column
    Goal.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def goal_params
    params.require(:goal).permit(:user_id, :title, :description, :priority, :complited, :due_date)
	end
end
