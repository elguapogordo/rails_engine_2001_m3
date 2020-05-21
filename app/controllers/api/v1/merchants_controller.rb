class Api::V1::MerchantsController < ApplicationController

  def index
    render_json(Merchant.all)
  end

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

  def create
    new_merchant = Merchant.create(name: params[:name])
    render_json(new_merchant)
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(name: params[:name])
    render_json(merchant)
  end

  def destroy
    merchant = Merchant.find(params[:id])
    merchant.destroy
    render_json(merchant)
  end

  private

  def render_json(merchant)
    render json: MerchantSerializer.new(merchant)
  end
end
