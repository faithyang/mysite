class SitevisitsController < ApplicationController
  before_action :set_sitevisit, only: [:show, :edit, :update, :destroy]

  # GET /sitevisits
  # GET /sitevisits.json
  def index
    @sitevisits = Sitevisit.all
  end

  # GET /sitevisits/1
  # GET /sitevisits/1.json
  def show
  end

  # GET /sitevisits/new
  def new
    @sitevisit = Sitevisit.new
  end

  # GET /sitevisits/1/edit
  def edit
  end

  # POST /sitevisits
  # POST /sitevisits.json
  def create
    @sitevisit = Sitevisit.new(sitevisit_params)

    respond_to do |format|
      if @sitevisit.save
        format.html { redirect_to @sitevisit, notice: 'Sitevisit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sitevisit }
      else
        format.html { render action: 'new' }
        format.json { render json: @sitevisit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sitevisits/1
  # PATCH/PUT /sitevisits/1.json
  def update
    respond_to do |format|
      if @sitevisit.update(sitevisit_params)
        format.html { redirect_to @sitevisit, notice: 'Sitevisit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sitevisit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sitevisits/1
  # DELETE /sitevisits/1.json
  def destroy
    @sitevisit.destroy
    respond_to do |format|
      format.html { redirect_to sitevisits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sitevisit
      @sitevisit = Sitevisit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sitevisit_params
      params.require(:sitevisit).permit(:ip, :ua)
    end
end
