require 'rails_helper'

describe MessagesController do
  describe '#index' do

    context 'ログインしている場合' do
      it '@messageに正しい値が入っていること' do
        expect(assigns(:message)).to be_a_new(Message)
      end
      it '@groupに正しい値が入っていること' do
        expect(assigns(:group)).to eq group
      end
      it 'index.html.erbに遷移すること' do
        expect(response).to render_template :index
      end
    end

  end
 end