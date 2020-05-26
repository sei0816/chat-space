require 'rails_helper'

describe MessagesController do
  let(:group) { create(:group) }
  let(:user) { create(:user) }

  describe '#index' do

    context 'ログインしている場合' do
      before do
        login user
        get :index, params: { group_id: group.id }
      end
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

    context 'ログインしていない場合' do
      before do
        get :index, params: { group_id: group.id }
      end
      it 'ログイン画面にリダイレクトすること' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

  describe '#create' do
    
    context 'ログインしているかつ、保存に成功した場合' do
      it 'メッセージの保存ができたこと' do
      end
      it 'new.html.erbに遷移すること' do
        get :new
        expect(response).to render_template :new
      end
    end

    context 'ログインしているが、保存に失敗した場合' do
      it 'メッセージの保存が行われなかったこと' do
      end
      it 'new.html.erbに遷移すること' do
        get :new
        expect(response).to render_template :new
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面にリダイレクトすること' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
 end