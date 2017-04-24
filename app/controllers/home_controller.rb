class HomeController < ApplicationController
  before_action :authenticate_user! # 添加用户鉴权（即登录才可以进入首页）
  def index; end
end
