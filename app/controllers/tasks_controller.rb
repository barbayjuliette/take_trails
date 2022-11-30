class TasksController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @task = Task.new(task_params)
    @task.user = current_user
    @task.trip = @trip
    respond_to do |format|
      if @task.save
        format.turbo_stream
        format.html { redirect_to tasks_url, notice: "Task was successfully created" }
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def toggle
    @task = Task.find(params[:id])
    @task.update(completed: params[:completed])

    render json: { message: "Done!" }
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url, notice: "Task was successfully updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@task) }
      format.html         { redirect_to tasks_path }
    end
  end

  def toggle
    @task = Task.find(params[:id])
    @task.update(completed: params[:completed])

    render json: { message: "Success" }
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
