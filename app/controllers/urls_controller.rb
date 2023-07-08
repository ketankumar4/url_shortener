class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to @url, notice: 'URL was successfully shortened.'
    else
      render :new
    end
  end

  def show
    @url = Url.find(params[:id])
  end

  def redirect
    @url = Url.find_by(short_url: params[:short_url])
    if @url
      redirect_to @url
    else
      redirect_to root_path, alert: 'Invalid shortened URL.'
    end
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end
end
