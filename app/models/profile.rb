class Profile
  include Mongoid::Document

  mount_uploader :avatar, AvatarUploader
  
  embedded_in :user

  field :nickname, type: String
  field :avatar, type: String
  
end
