class DisputesController < ApplicationController
  before_action :set_dispute, only: [:show, :edit, :update, :destroy]

  # GET /disputes
  # GET /disputes.json
  def index
    @disputes = Dispute.public_channels
  end

  # GET /disputes/1
  # GET /disputes/1.json
  def show
    @messages = @dispute.messages.order(created_at: :desc).limit(100).reverse
    @dispute_user = current_user.dispute_users.find_by(dispute_id: @dispute.id)
  end

  # GET /disputes/new
  def new
    @dispute = Dispute.new
  end

  # GET /disputes/1/edit
  def edit
  end

  # POST /disputes
  # POST /disputes.json
  def create
    @dispute = Dispute.new(dispute_params)

    respond_to do |format|

      if @dispute.save
        @dispute.dispute_users.where(user_id: current_user.id).first_or_create
        format.html { redirect_to @dispute, notice: 'Dispute was successfully created.' }
        format.json { render :show, status: :created, location: @dispute }
      else
        format.html { render :new }
        format.json { render json: @dispute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disputes/1
  # PATCH/PUT /disputes/1.json
  def update
    respond_to do |format|
      if @dispute.update(dispute_params)
        format.html { redirect_to @dispute, notice: 'Dispute was successfully updated.' }
        format.json { render :show, status: :ok, location: @dispute }
      else
        format.html { render :edit }
        format.json { render json: @dispute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disputes/1
  # DELETE /disputes/1.json
  def destroy
    @dispute.destroy
    respond_to do |format|
      format.html { redirect_to disputes_url, notice: 'Dispute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispute
      @dispute = Dispute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dispute_params
      params.require(:dispute).permit(:name)
    end
end
