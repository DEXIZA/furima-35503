require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    # @item.image = fixture_file_upload("public/images/timage.png")

  end

  describe '商品出品機能' do
    context 'できる時' do
      it '全て問題の無い状態であれば登録に成功する' do
        expect(@item).to be_valid
      end
    end
    context 'できない時' do
      it '○○だと出来ない' do
      end
    end
  end
end
