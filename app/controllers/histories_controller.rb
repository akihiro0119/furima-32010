class HistoriesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!

  def index
    if @item.user.id == current_user.id || @item.history != nil
      redirect_to root_path
    end
    @user_history = UserHistory.new
  end

  def create
    @user_history = UserHistory.new(history_params)
    if @user_history.valid?
      pay_item
       @user_history.save
      redirect_to root_path
    else
      render action: :index
    end
  end

    private
    def history_params
      params.require(:user_history).permit(:postal_coad, :pref_id, :city, :addresses_coad, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: history_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end
end