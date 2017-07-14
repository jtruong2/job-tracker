class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @company = Company.find(@job.company_id)
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = @company.jobs.update(job_params)
    if @job[0].update(job_params)
      redirect_to company_job_path(@company.id, @job)
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    Job.destroy(params[:id])
    redirect_to @company
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
