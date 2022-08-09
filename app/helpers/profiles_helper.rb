module ProfilesHelper
  def profile_gravatar(profile)
    user = profile.user
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase) # get img hash for email
    gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}" # create url for image using hash
    image_tag(gravatar_url, alt: user.name) # return an image tag to be placed on a view

    # read section under the devloper resources->gravatr urls->gravatar image requests
  end
end
