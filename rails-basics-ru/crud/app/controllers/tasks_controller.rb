class TasksController < ApplicationController
  def index
    @tasks = Task.order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to task_path(@task)
    else
      flash[:alert] = 'task cannot be created'
      # Отрисовывается форма создания, все параметры остаются
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'task was successfully updated'

      redirect_to task_path(@task)
    else
      flash[:alert] = 'Task cannot be updated'

      redirect_to task_path(@task)
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:success] = 'task was successfully deleted'

      redirect_to tasks_path()
    else
      flash[:alert] = 'task cannot be deleted'

      redirect_to task_path(@task)
    end
  end
  private

  def task_params
    params.required(:task).permit(:completed, :creator, :description, :name, :performer, :status)
  end
end
