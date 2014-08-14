class JobseekersController < ApplicationController
  before_action :set_jobseeker, only: [:show, :edit, :update, :destroy]

  # GET /jobseekers
  # GET /jobseekers.json
  def index
    @jobseekers = Jobseeker.all
  end

  # GET /jobseekers/1
  # GET /jobseekers/1.json
  def show
  end

  # GET /jobseekers/new
  def new
    @jobseeker = Jobseeker.new
  end

  # GET /jobseekers/1/edit
  def edit
  end

  # POST /jobseekers
  # POST /jobseekers.json
  def create
    @jobseeker = Jobseeker.new(jobseeker_params)

    respond_to do |format|
      if @jobseeker.save
        format.html { redirect_to @jobseeker, notice: 'Jobseeker was successfully created.' }
        format.json { render :show, status: :created, location: @jobseeker }
      else
        format.html { render :new }
        format.json { render json: @jobseeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobseekers/1
  # PATCH/PUT /jobseekers/1.json
  def update
    respond_to do |format|
      if @jobseeker.update(jobseeker_params)
        format.html { redirect_to @jobseeker, notice: 'Jobseeker was successfully updated.' }
        format.json { render :show, status: :ok, location: @jobseeker }
      else
        format.html { render :edit }
        format.json { render json: @jobseeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobseekers/1
  # DELETE /jobseekers/1.json
  def destroy
    @jobseeker.destroy
    respond_to do |format|
      format.html { redirect_to jobseekers_url, notice: 'Jobseeker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobseeker
      @jobseeker = Jobseeker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jobseeker_params
      params[:jobseeker]
    end
end
