class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_customer, except: [:index, :new, :create]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(customer_params)

    redirect_to @customer, notice: 'Created Successfully'
  end

  def show
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Updated Successfully'
    else
      redirect_to :root, error: 'Could not update customer.'
    end
  end

  def destroy
    @customer.destroy!

    redirect_to :root, notice: "Deleted Successfully."
  end

  private

  def customer_params
    params.require(:customer).permit(:name)
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end
end