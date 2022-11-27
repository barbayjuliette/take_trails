class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @task = Task.new(task_params)
    @task.user = current_user
    @task.trip = @trip
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: "Task was successfully created" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
