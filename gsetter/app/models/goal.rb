class Goal < ActiveRecord::Base

  belongs_to(
    :user,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
  )

  validates :body, :user_id, presence: {message: "can't be blank"}
  


end
