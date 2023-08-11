class PaymentsEntitiesController < ApplicationController
  before_action :set_group
  before_action :set_payments_entity, only: %i[show edit update destroy]

  def index
    @group = Group.find(params[:group_id])
    @payments_entities = @group.payments_entities.where(author_id: current_user.id).order(created_at: :desc)
    @total = @payments_entities.sum(:amount)
  end

  def new
    @group = Group.find(params[:group_id])
    @payments_entity = @group.payments_entities.build
  end

  def show
    @group = Group.find(params[:group_id])
    @payment = @group.payments_entities.build
  end

  def create
    @payment = @group.payments_entities.build(payments_entity_params)
    @payment.author_id = current_user.id

    if @payment.valid? && @payment.save
      Categorisation.create(payments_entity: @payment, group: @group)
      # Update the @payments_entities variable to include the new transaction
      # @payments_entities = @group.payments_entities
      redirect_to group_payments_entities_path(@group), notice: 'Transaction added successfully.'
    else
      puts @payment.errors.full_messages
      render :new
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_payments_entity
    @payments_entity = PaymentsEntity.find(params[:id])
  end

  def payments_entity_params
    params.require(:payments_entity).permit(:name, :amount)
  end
end
