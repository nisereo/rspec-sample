require 'rails_helper'

RSpec.describe Article, type: :model do
  shared_context 'タイトルの文字数が' do |num|
    let(:title) { 'a' * num }
    before {
      allow(Article).to receive(:find).and_return('Mockだよ')
    }
  end

  shared_examples_for '次のタイトルが返ること' do |title|
    it { is_expected.to eq(title) }
  end

  let(:article) { Article.create(title: title) }
  describe '.abbreviated_title' do
    subject { article.abbreviated_title }
    context '記事タイトルが19文字の場合' do
      include_context 'タイトルの文字数が', 19
      it_behaves_like '次のタイトルが返ること', "#{'a' * 19}"
    end

    context '記事タイトルが20文字の場合' do
      include_context 'タイトルの文字数が', 20
      it_behaves_like '次のタイトルが返ること', "#{'a' * 19}…"
    end
  end

  describe '.break_title' do
    subject { article.break_title }
    context '記事タイトルが19文字の場合' do
      include_context 'タイトルの文字数が', 19
      it_behaves_like '次のタイトルが返ること', "#{'a' * 19}"
    end

    context '記事タイトルが20文字の場合' do
      include_context 'タイトルの文字数が', 20
      it_behaves_like '次のタイトルが返ること', "#{'a' * 20}"
    end

    context '記事タイトルが21文字の場合' do
      include_context 'タイトルの文字数が', 21
      it_behaves_like '次のタイトルが返ること', "#{'a' * 20}\\na"
    end
  end
end
