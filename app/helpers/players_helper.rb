module PlayersHelper
  def avatar_for(player)
    @avatar = player.photo.key
    if @avatar.empty?
      image_tag('avatar-default.svg', alt: "#{player.name}'s avatar picture")
    else
      cl_image_tag(@avatar, alt: "#{player.name}'s avatar picture")
    end
  end
end
