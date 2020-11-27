class UserHistory
  include ActiveModel::Model
  attr_accessor :token, :postal_coad, :pref_id, :city, :addresses_coad, :building, :telephone, :user_id, :item_id

  with_options presence: true do
    validates :postal_coad, format: {with:/\A\d{3}[-]\d{4}\z/, message:'is invalid. Input full-width characters.'}
    validates :city, :token, :addresses_coad, :user_id, :item_id
    validates :pref_id, {numericality: { other_than: 1 }}
    # validates :telephone, {numericality: { maximum: 11 }}
    validates :telephone, numericality:{ greater_than_or_equal_to: 1, less_than_or_equal_to: 99999999999}
    # format: {with:/\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/, message:'is invalid. Input full-width characters.'}
  end

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Address.create!(postal_coad: postal_coad, pref_id: pref_id, city: city, addresses_coad: addresses_coad, building: building, telephone: telephone, history_id: history.id)
  end
end