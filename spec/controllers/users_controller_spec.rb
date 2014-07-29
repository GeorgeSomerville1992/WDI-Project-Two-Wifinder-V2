require "spec_helper"
  
describe UsersController do
  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end
  let(:users) { FactoryGirl.create_list :user, 3}
  let(:logged_user) { users[0] }
  
  describe "GET index" do
    context "with logged in user" do
      before do
        logged_user.confirm!
        sign_in logged_user
        friendship = Friendship.create!(user: logged_user, friend: users.last).accept!
        get :index
      end
      it "should instantiate users" do
        expect(assigns[:users].length).to eq users.length
      end

      it "should instantiate @friends" do
        expect(assigns[:friends]).to eq logged_user.friends
      end

      it "should render index" do
        expect(response).to render_template("index")
      end

      it "should respond to 200 status" do
        response.status.should eq 200
      end
    end

    context "with non logged in user" do
      it "should redirect to new_user_session_path" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "GET show" do
    context "with logged in user" do
      before do
        logged_user.confirm!
        invite = Friendship.create!(user: logged_user, friend: users.last)
        sign_in logged_user
        get :show, {id: logged_user.id}
      end
      it "should instantiate @user" do
        expect(assigns[:user]).to eq logged_user
      end 

      it "should instantiate @invites" do
        
        expect(assigns[:invites].length).to eq logged_user.pending_friend_invites_received.length
      end
      it "should instantiate @friends" do
        
        expect(assigns[:friends]).to eq logged_user.friends
      end
      it "should respond to 200 status" do
        
        response.status.should eq 200
      end
    end 
    context "with non logged in user" do
      it "should redirect to new_user_session_path" do
        get :show, {id: logged_user.id}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "GET befriend" do
    context "with logged in user" do
      before do
        logged_user.confirm!
        sign_in logged_user
        pending_friendship = Friendship.create!(user: logged_user, friend: users.last)
      end
      it "should create pending_friendship" do
        Friendship.should_receive(:create!)
        get :befriend, {id: logged_user.id}
        
      end
      it "should send flash message" do
        get :befriend, {id: logged_user.id}
        request.flash[:notice].should_not be_nil
      end
      it "should redirect_to saved_networks" do
        get :befriend, {id: logged_user.id}
        expect(response).to redirect_to saved_networks_path
      end
    end

    context "with non logged in user" do
      it "should redirect to new_user_session_path" do
        get :befriend, {id: logged_user.id}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

end
