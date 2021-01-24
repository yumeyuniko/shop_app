# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  explanation :text(65535)
#  name        :string(255)
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  with_options presence: true do
    validates :name,             length: { maximum: 40 }
    validates :explanation,      length: { maximum: 1000 }
    validates :price,            numericality:
               { greater_than_or_equal_to: 300, less_than_or_equal_to: 999_999 }
  end
end
