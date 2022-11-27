class TasksController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
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
        format.json
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def toggle
    @task = Task.find(params[:id])
    @task.update(completed: params[:completed])

    render json: { message: "Success" }
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url, notice: "Task was successfully updated" }
        format.json
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice: "Post was successfully deleted."
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
