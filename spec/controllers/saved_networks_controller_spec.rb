require "spec_helper"

describe SavedNetworksController do
  let(:saved_networks) { FactoryGirl.create_list :saved_network, 5}
  let(:logged_user) { saved_networks.first.user }
  let(:friend_network) { saved_networks.last}
  let(:friend) { saved_networks.last.user}
  
  
  describe "GET index" do
    context "user logged in"
      before do
        @friendship = Friendship.create!(user: logged_user, friend: friend).accept!
        logged_user.confirm!
        sign_in logged_user
        get :index
      end
      it "should instantiate @saved_networks" do
        expect(assigns[:saved_networks].length).to eq logged_user.saved_networks.length
      end
      it "should instantiate @friends_networks" do
        expect(assigns[:friends_networks]).to eq [friend_network]
      end


  end
end