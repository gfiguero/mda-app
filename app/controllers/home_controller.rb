class HomeController < ApplicationController
  def index
  end

  def create
    respond_to do |format|
      format.html { redirect_to root_path, notice: I18n.t("home.message.created") }
      format.turbo_stream { flash.now[:notice] = I18n.t("home.message.created") }
    end
  end

  def update
    respond_to do |format|
      format.html { redirect_to root_path, notice: I18n.t("home.message.updated") }
      format.turbo_stream { flash.now[:notice] = I18n.t("home.message.updated") }
    end
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: I18n.t("home.message.destroyed") }
      format.turbo_stream { flash.now[:notice] = I18n.t("home.message.destroyed") }
    end
  end
end
