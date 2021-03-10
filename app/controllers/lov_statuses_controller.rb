class LovStatusesController < ApplicationController
  before_action :set_lov_status, only: %i[ show edit update destroy ]

  # GET /lov_statuses or /lov_statuses.json
  def index
    @lov_statuses = LovStatus.all
  end

  # GET /lov_statuses/1 or /lov_statuses/1.json
  def show
  end

  # GET /lov_statuses/new
  def new
    @lov_status = LovStatus.new
  end

  # GET /lov_statuses/1/edit
  def edit
  end

  # POST /lov_statuses or /lov_statuses.json
  def create
    @lov_status = LovStatus.new(lov_status_params)

    respond_to do |format|
      if @lov_status.save
        format.html { redirect_to @lov_status, notice: "Lov status was successfully created." }
        format.json { render :show, status: :created, location: @lov_status }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lov_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lov_statuses/1 or /lov_statuses/1.json
  def update
    respond_to do |format|
      if @lov_status.update(lov_status_params)
        format.html { redirect_to @lov_status, notice: "Lov status was successfully updated." }
        format.json { render :show, status: :ok, location: @lov_status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lov_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lov_statuses/1 or /lov_statuses/1.json
  def destroy
    @lov_status.destroy
    respond_to do |format|
      format.html { redirect_to lov_statuses_url, notice: "Lov status was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lov_status
      @lov_status = LovStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lov_status_params
      params.require(:lov_status).permit(:status)
    end
end
