# -*- encoding : utf-8 -*-
class BellsController < InheritedResources::Base
  # GET /bells
  # GET /bells.json
  #has_scope :search , :only => [:index] ,:type => :hash, :default => {:zone=>"zh"}
  def index
    @bells = Bell.search(params[:search]||{}).page(params[:page]).per(params[:per]||3)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: 
        @bells.collect{|b|
          tmp_arr = {}
          tmp_arr['tag_names']= b.tags.pluck(:title)
          tmp_arr['created_at'] = b.created_at.to_s
          tmp_arr['id']= b.id
          tmp_arr['name']= b.name
          tmp_arr['file_location']="http://115.29.151.9/"+b.file_location.to_s
          tmp_arr['file_size']=b.file_size
          tmp_arr['duration']=b.duration
          tmp_arr['singer']=b.singer
          tmp_arr 
        } 
      }
    end
  end

  # GET /bells/1
  # GET /bells/1.json
  def show
    @bell = Bell.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bell }
    end
  end

  # GET /bells/new
  # GET /bells/new.json
  def new
    @bell = Bell.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bell }
    end
  end

  # GET /bells/1/edit
  def edit
    @bell = Bell.find(params[:id])
  end

  # POST /bells
  # POST /bells.json
  def create
    @bell = Bell.new(params[:bell])

    respond_to do |format|
      if @bell.save
        format.html { redirect_to @bell, notice: ' 铃声创建成功.' }
        format.json { render json: @bell, status: :created, location: @bell }
      else
        format.html { render action: "new" }
        format.json { render json: @bell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bells/1
  # PUT /bells/1.json
  def update
    @bell = Bell.find(params[:id])

    respond_to do |format|
      if @bell.update_attributes(params[:bell])
        format.html { redirect_to @bell, notice: ' 铃声更新成功.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bells/1
  # DELETE /bells/1.json
  def destroy
    @bell = Bell.find(params[:id])
    @bell.destroy

    respond_to do |format|
      format.html { redirect_to bells_url }
      format.json { head :no_content }
    end
  end
end
