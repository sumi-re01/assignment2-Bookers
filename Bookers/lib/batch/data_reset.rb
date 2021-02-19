class Batch::DataReset
  def self.data_reset
    Book.delete_all
    p "投稿を全て削除しました"
  end
end
# config/application.rbに読み込みの記載
# config.paths.add 'lib', eager_load: true
# ↓で実行
# bundle exec rails runner Batch::DataReset.data_reset
# 定期的な実行はcronで設定する