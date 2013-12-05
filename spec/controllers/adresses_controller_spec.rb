require 'spec_helper'

describe AdressesController do

  before(:each) do
    @adress = build(:adress)
    @attr = attributes_for(:adress)
  end

  it 'should render the index view' do
    get :index
    expect(response).to render_template(:index)
  end

  it 'should create a new blank adress using #new' do
    get :new
    expect(assigns(:adress)).to be_a_new(Adress)
  end

  it 'should render the new view' do
    get :new
    expect(response).to render_template(:new)
  end

  it 'should create a new adress using #create with params' do
    expect{ post :create, { adress: @attr } }.to change(Adress,:count).by(1)
  end

  it 'should redirect to #index after a exitous #create' do
    post :create, { adress: @attr }
    expect(response).to redirect_to(adresses_path)
  end

end