class SavedNetworksController < ApplicationController
  before_filter :authenticate_user!
  include SavedNetworksHelper
  # GET /saved_networks
  # GET /saved_networks.json
  def index
    @saved_networks = current_user.saved_networks
    @friends_networks = SavedNetwork.friends_networks(current_user)
    @markers = build_markers @saved_networks, "31708f"
    @friends_markers = build_markers @friends_networks, "f5f5f5"
    gon.markers = @markers
    gon.friends_markers = @friends_markers
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @saved_networks }
    end
  end

  # GET /saved_networks/1
  # GET /saved_networks/1.json
  def show
    @saved_network = SavedNetwork.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @saved_network }
    end
  end

  # GET /saved_networks/new
  # GET /saved_networks/new.json
  def new
    @saved_network = SavedNetwork.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @saved_network }
    end
  end

  # GET /saved_networks/1/edit
  def edit
    @saved_network = SavedNetwork.find(params[:id])
  end

  # POST /saved_networks
  # POST /saved_networks.json
  def create
    @saved_network = current_user.saved_networks.new(params[:saved_network])

    respond_to do |format|
      if @saved_network.save
        format.html { redirect_to @saved_network, notice: 'Saved network was successfully created.' }
        format.json { render json: @saved_network, status: :created, location: @saved_network }
      else
        format.html { render action: "new" }
        format.json { render json: @saved_network.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /saved_networks/1
  # PUT /saved_networks/1.json
  def update
    @saved_network = SavedNetwork.find(params[:id])

    respond_to do |format|
      if @saved_network.update_attributes(params[:saved_network])
        format.html { redirect_to @saved_network, notice: 'Saved network was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @saved_network.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_networks/1
  # DELETE /saved_networks/1.json
  def destroy
    @saved_network = SavedNetwork.find(params[:id])
    @saved_network.destroy

    respond_to do |format|
      format.html { redirect_to saved_networks_url }
      format.json { head :no_content }
    end
  end

private
  def build_markers networks, color
    Gmaps4rails.build_markers(networks) do |network, marker|
      marker.lat(network.latitude)
      marker.lng(network.longitude)
      marker.infowindow(marker_legend(network))
      marker.picture({
        :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=|#{color}|000000",
        :width   => 32,
        :height  => 32
        })
    end
  end
end
