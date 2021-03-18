class TokisController < ApplicationController
  before_action :set_toki, only: %i[ show edit update destroy ]

  # GET /tokis or /tokis.json
  def index
=begin
    if params[:sort_direction].nil? || params[:sort_direction] == "asc"
=end
    if params[:sort_direction].nil? || params[:sort_direction].upcase == "ASC"
      sort_direction = "DESC"
    elsif params[:sort_direction] == "DESC"
      sort_direction = "ASC"
    else
      sort_direction = "DESC"
    end
    @sort_direction = sort_direction

    if Toki.column_names.include?(params[:sort])
      # && @sort_direction == "desc" || "asc"
      @tokis = Toki.order("#{params[:sort]} #{sort_direction}")
    elsif params[:sort] == "clock_in_time"
      @tokis = Toki.all.order("clock_in #{sort_direction}")
    elsif params[:sort] == "clock_out_time"
      @tokis = Toki.all.order("clock_out #{sort_direction}")
    elsif params[:sort] == "duration_in_hours"
      @tokis = Toki.duration(sort_direction)
    else
      @tokis = Toki.order("clock_in #{sort_direction}")
    end


  end

  # GET /tokis/1 or /tokis/1.json
  def show
  end

  # GET /tokis/new
  def new
    @toki = Toki.new
  end

  # GET /tokis/1/edit
  def edit
  end

  # POST /tokis or /tokis.json
  def create
    @toki = Toki.new(toki_params)

    respond_to do |format|
      if @toki.save
        format.html { redirect_to @toki, notice: "Toki was successfully created." }
        format.json { render :show, status: :created, location: @toki }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @toki.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tokis/1 or /tokis/1.json
  def update
    respond_to do |format|
      if @toki.update(toki_params)
        format.html { redirect_to @toki, notice: "Toki was successfully updated." }
        format.json { render :show, status: :ok, location: @toki }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @toki.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tokis/1 or /tokis/1.json
  def destroy
    @toki.destroy
    respond_to do |format|
      format.html { redirect_to tokis_url, notice: "Toki was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_toki
      @toki = Toki.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def toki_params
      params.require(:toki).permit(:clock_in, :clock_out, :note, :sort_direction, :status_id)
    end
end
