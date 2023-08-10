class PaymentsEntitiesController < ApplicationController
  before_action :set_payments_entity, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /payments_entities or /payments_entities.json
  def index
    @payments_entities = PaymentsEntity.all
  end

  # GET /payments_entities/1 or /payments_entities/1.json
  def show; end

  # GET /payments_entities/new
  def new
    @payments_entity = PaymentsEntity.new
  end

  # GET /payments_entities/1/edit
  def edit; end

  # POST /payments_entities or /payments_entities.json
  def create
    @payments_entity = PaymentsEntity.new(payments_entity_params)

    respond_to do |format|
      if @payments_entity.save
        format.html { redirect_to payments_entity_url(@payments_entity), notice: 'Entity was successfully created.' }
        format.json { render :show, status: :created, location: @payments_entity }
      else
        format.html { render :new, status: :unprocessable_payments_entity }
        format.json { render json: @payments_entity.errors, status: :unprocessable_payments_entity }
      end
    end
  end

  # PATCH/PUT /payments_entities/1 or /payments_entities/1.json
  def update
    respond_to do |format|
      if @payments_entity.update(payments_entity_params)
        format.html { redirect_to entity_url(@payments_entity), notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @payments_entity }
      else
        format.html { render :edit, status: :unprocessable_payments_entity }
        format.json { render json: @payments_entity.errors, status: :unprocessable_payments_entity }
      end
    end
  end

  # DELETE /payments_entities/1 or /payments_entities/1.json
  def destroy
    @payments_entity.destroy

    respond_to do |format|
      format.html { redirect_to payments_entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payments_entity
    @payments_entity = Payments_entity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def payments_entity_params
    params.require(:payments_entity).permit(:author_id, :name, :amount, :created_at)
  end
end
