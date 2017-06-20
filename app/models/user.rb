class User < ActiveRecord::Base
  has_many :carts
  belongs_to :current_cart, class_name: "Cart"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def set_current_cart
    new_cart = carts.create
    update(current_cart_id: new_cart.id)
  end
end
