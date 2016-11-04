class Api::V1::JobsController < ApplicationController
  respond_to :json
  before_action :authenticate

  def index
    @jobs = current_user.jobs
    respond_with @jobs
  end

  def show
    respond_with @job
  end

  def create
    @job = current_user.jobs.build(job_params)
    if @job.save
      render json: @job, status: 201
    else
      render json: { errors: @job.errors.full_messages }, status: 422
    end
  end

  def update
    @job = current_user.jobs.find(params[:id])
    @job.update_attributes!(job_params)
  end

  def destroy
    @job.destroy if Rails.env.development?
    head 204
  end


  private

    def get_job
      @job = job.find(params[:id])
    end

    def job_params
      params.permit(:jobtitle, :company, :city, :state, :url, :snippet, :jobkey, :status, :contact_email, :contact_name)
    end

end
