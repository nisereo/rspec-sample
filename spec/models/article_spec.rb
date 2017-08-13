require 'rails_helper'

RSpec.describe Article, type: :model do


  describe '.published' do
    context '記事が非公開状態の場合' do
      it '記事が公開状態になること' do
        article = Article.new(status: :draft)
        article.published
        expect(article.published?).to be_truthy
      end
    end

    context '記事が公開状態の場合' do
      it '記事が公開状態のままであること' do
        article = Article.new(status: :published)
        article.published
        expect(article.published?).to be_truthy
      end
    end
  end
end
