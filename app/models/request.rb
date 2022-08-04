class Request < ApplicationRecord
  belongs_to :user

  def self.interacted?(id1, id2)
    case1 = !Request.where(user_id: id1, friend_id: id2).empty?
    case2 = !Request.where(user_id: id2, friend_id: id1).empty?
    case1 || case2
  end

  def self.accepted_record?(id1, id2)
    case1 = !Request.where(user_id: id1, friend_id: id2, accepted: true).empty?
    case2 = !Request.where(user_id: id2, friend_id: id1, accepted: true).empty?
    case1 || case2
  end

  def self.find_request(id1, id2)
    if Request.where(user_id: id1, friend_id: id2, accepted: true).empty?
      Request.where(user_id: id2, friend_id: id1, accepted: true)[0].id
    else
      Request.where(user_id: id1, friend_id: id2, accepted: true)[0].id
    end
  end
end
