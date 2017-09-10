class ProjectsController < ApplicationController
     before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
    @projects = Project.all
    end 

    def show
    @project = Project.find(params[:id])
    end    

    def new
    @project = Project.new
    @users = User.all
    end

    def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to '/users'
    else
      render_to '/projects/new'
    end 
    end

    def destroy
    @project.destroy
    redirect_to '/users'
    end

    def edit
    @project = Project.find(params[:id])
    @users = User.all
    end

    def update
    if @project.update(project_params)
      redirect_to @project
    else
      redirect_back fallback_location: edit_project_path(@project)
    end
    end

    def search
      redirect_to search_project_path(params[:q])
    end

 private
    def project_params
    params.require(:project).permit(:title, :description, :user_id)
    end

    def set_project
    @project = Project.find(params[:id])
    end
end
