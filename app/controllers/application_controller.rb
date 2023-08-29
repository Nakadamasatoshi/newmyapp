class ApplicationController < ActionController::Base

  # この行を追加。でも強制的にログイン画面に移動してしまうので一旦隠す
  # before_action :authenticate_user!
  # これで良さそう

end
