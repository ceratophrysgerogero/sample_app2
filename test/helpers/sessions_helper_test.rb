require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users(:michael)
    remember(@user)
  end

  test "current_user returns right user when session is nil" do
    assert_equal @user, current_user
    assert is_logged_in?
  end

  # ユーザーの帰国ダイジェストが記憶トークンと正しく対応していない場合
  # 今のユーザーがnilになるかテスト
  test "current_user returns nil when remember diigest is worng" do
    @user.update_attribute(:remember_digest,User.digest(User.new_token))
    assert_nil current_user
  end
end
