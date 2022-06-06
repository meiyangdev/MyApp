class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :email, :user_id)
  end
end
