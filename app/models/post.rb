class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :title
  validates :body, :title, :author_id, presence: true
  # validates :author_id, uniqueness: true

  belongs_to :author, class_name: "User", foreign_key: :author_id, inverse_of: :posts

  delegate :username,
            to: :author,
            prefix: true


end
