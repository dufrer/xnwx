class GameSourcesController < ApplicationController
  # GET /game_sources
  # GET /game_sources.json
  def index
    @game_sources = GameSource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @game_sources }
    end
  end

  # GET /game_sources/1
  # GET /game_sources/1.json
  def show
    @game_source = GameSource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game_source }
    end
  end

  # GET /game_sources/new
  # GET /game_sources/new.json
  def new
    @game_source = GameSource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game_source }
    end
  end

  # GET /game_sources/1/edit
  def edit
    @game_source = GameSource.find(params[:id])
  end

  # POST /game_sources
  # POST /game_sources.json
  def create
    @game_source = GameSource.new(params[:game_source])

    respond_to do |format|
      if @game_source.save
        format.html { redirect_to @game_source, notice: 'Game source was successfully created.' }
        format.json { render json: @game_source, status: :created, location: @game_source }
      else
        format.html { render action: "new" }
        format.json { render json: @game_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /game_sources/1
  # PUT /game_sources/1.json
  def update
    @game_source = GameSource.find(params[:id])

    respond_to do |format|
      if @game_source.update_attributes(params[:game_source])
        format.html { redirect_to @game_source, notice: 'Game source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_sources/1
  # DELETE /game_sources/1.json
  def destroy
    @game_source = GameSource.find(params[:id])
    @game_source.destroy

    respond_to do |format|
      format.html { redirect_to game_sources_url }
      format.json { head :no_content }
    end
  end
end
