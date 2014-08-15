class ProjectsController < ApplicationController
  before_action :get_project, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all 
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      respond_to do |format|
        format.js
      end
    else
      flash[:warning] = "The project title cannot be blank!"
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @project.update_attributes(project_params)
    respond_to do |format|
      format.js
    end
  end


  private
  def get_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :due_date)
  end

end
