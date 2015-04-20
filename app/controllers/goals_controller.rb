class GoalsController < ApplicationController
  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.author = current_user

    if @goal.save
      redirect_to @goal
    else
      flash[:error] = @goal.errors.full_messages
      render :new
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def index
    @goals = current_user.goals
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])

    if @goal.update(goal_params)
      redirect_to @goal
    else
      flash[:error] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    flash[:success] = "Goal deleted!"
    redirect_to goals_url
  end

  private

  def goal_params
    params.require(:goal).permit(:body, :is_private, :is_complete)
  end
end
