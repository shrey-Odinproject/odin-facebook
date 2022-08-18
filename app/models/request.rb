class Request < ApplicationRecord
  belongs_to :user

  def self.interacted?(id1, id2)
    case1 = !Request.where(user_id: id1, friend_id: id2).empty?
    case2 = !Request.where(user_id: id2, friend_id: id1).empty?
    case1 || case2
  end

  # questioning if two of the given ids have any request-records in our table

  # def self.accepted_record?(id1, id2)
  #   case1 = !Request.where(user_id: id1, friend_id: id2, accepted: true).empty?
  #   case2 = !Request.where(user_id: id2, friend_id: id1, accepted: true).empty?
  #   case1 || case2
  # end

  # This method is basically checking for an accepted request-record for two given ids, used in friend_with? in user.rb

  # def self.find_accepted_request(id1, id2)
  #   if Request.where(user_id: id1, friend_id: id2, accepted: true).empty?
  #     Request.where(user_id: id2, friend_id: id1, accepted: true)[0].id
  #   else
  #     Request.where(user_id: id1, friend_id: id2, accepted: true)[0].id
  #   end
  # end

  # Useful when deleting an accepted request-record  (when u wanna delete a friend)
end
