class SongsController < ApplicationController
  def index
    @user = User.find(session[:login])
    @songs = Song.all.order(created_at: :desc)
    render 'songs/index'
  end
  def create
    song = Song.new(song_params)
    if song.valid?
      song.save
    else
      flash[:error] = song.errors.full_messages
    end
    redirect_to '/songs'
  end
  def showlist
    @user = User.find(params[:id])
    @lists = Songlist.joins(:user).where(user_id: params[:id])
    render 'songs/showlist'
  end
  def showsong
    @song = Song.find(params[:id])
    @lists = Songlist.joins(:user).where(song_id: params[:id])
    render 'songs/showsong'
  end
  def add
    user = User.find(session[:login])
    song = Song.find(params[:id])
    song.added += 1
    song.save
    if song.users.exists?(user.id)
      list = song.songlists.find_by(user_id: user.id)
      list.added += 1
      list.save
    else
      entry = Songlist.new(user: user, song: song)
      entry.save
    end
    redirect_to '/songs'
  end

  private

  def song_params
    params.require(:song).permit(:artist, :title)
  end
end
