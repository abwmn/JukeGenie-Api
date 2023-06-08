class Api::V1::Users::PlaylistsController < ApplicationController
  def index
    @user = User.find(params[:id])
    render json: { hosted_playlists: Playlist.where("host_id = #{@user.id}"), joined_playlists: Playlist.joins(:user_playlists).where(user_playlists: {dj: false, user_id: "#{@user.id}"}) }
  end
end


