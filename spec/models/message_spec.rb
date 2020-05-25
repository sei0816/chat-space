require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    context 'メッセージを保存できる場合' do
      it "メッセージがあれば保存できること" do
        expect(build(:message, image: nil)).to be_valid
      end
      it "画像があれば保存できること" do
        expect(build(:message, content: nil)).to be_valid
      end
      it "メッセージと画像があれば保存できること" do
        expect(build(:message)).to be_valid
      end
    end

  end    
 end