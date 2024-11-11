class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save

    redirect_to project_path(@project)
  end

  private

  def project_params
    params.require(:project).permit(:title, :content)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project.update(project_params)

    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path, status: :see_other
  end


end
