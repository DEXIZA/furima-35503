require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '入力成功の時' do
      it '全ての入力欄が問題無い状態であれば登録に成功する' do
        expect(@item).to be_valid
      end
      it 'priceが300以上だと登録出来る' do
        @item.price = '300'
        expect(@item).to be_valid
      end
      it 'priceが9999999以下だと登録出来る' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
    end
    context 'できない時' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'user_idが空では登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'priceが299以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが10000000以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが全角文字では登録できない' do
        @item.price = 'ああ唖々'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが半角英数字混合では登録できない' do
        @item.price = '222aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが半角英数字では登録できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shippingcharge_idが空では登録できない' do
        @item.shippingcharge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingcharge can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shippingtime_idが空では登録できない' do
        @item.shippingtime_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingtime can't be blank")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idが1では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'shippingcharge_idが1では登録できない' do
        @item.shippingcharge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shippingcharge must be other than 1')
      end
      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'shippingtime_idが1では登録できない' do
        @item.shippingtime_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shippingtime must be other than 1')
      end
    end
  end
end
