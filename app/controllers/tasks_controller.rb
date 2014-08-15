class TasksController < ApplicationController
  before_action :find_project
  before_action :find_task, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @task = @project.tasks.new
  end

  def create
    @task = @project.tasks.new(task_params)
    @task.save

    if @task.save
      respond_to do |format|
        format.js
      end

    else
      flash[:warning] = "You tried to create a task that had nothing."
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def update
    if @task.update_attributes(task_params)
      respond_to do |format|
        format.js
      end
    else
      flash[:warning] = "The content cannot be blank"
      respond_to do |format|
        format.js
      end
    end
  end



private
def find_project
  @project = Project.find(params[:project_id])
end

def find_task
  @task = @project.tasks.find(params[:id])
end

def task_params
  params.require(:task).permit(:title, :due_date)
end


end
