  class Article < ApplicationRecord

    has_many :comments

  # タイトルは必須、かつ20文字までの入力とする
  validates :title, presence: true, length: {maximum: 20}

  # ActiveRecord の enum 機能を使ってステータスを持たせる
  # draft: 記事が下書きの状態
  # published: 記事が公開された状態
  enum status: { draft: 0, published: 1 }

  before_create :greet

  scope :published, -> { where(status: Article.statuses['published']) }

  def greet
    p 'コールバック'
  end

  # 記事を公開する
  def publish
    return if self.published?
    update({status: Article.statuses['published'], published_at: Time.current})
  end

  # 20文字以上の記事タイトルを省略する
  def abbreviated_title
    title.size >= 20 ? "#{title.slice(0, 19)}…" : title
  end

  # 20文字毎に記事タイトルに改行コードを入れる
  # 最後が改行コードになる場合は改行コードはつかない
  def break_title
    return if title.nil?
    title.scan(/.{1,20}/).join('\n')
  end
end