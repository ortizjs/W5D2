class PostSub < ApplicationRecord
    # validates :pos
  belongs_to :post
  belongs_to :sub
end
