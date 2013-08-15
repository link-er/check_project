class Admin::Catalog::To::ToTypesController < ApplicationController
  respond_to :html

  # before_filter :auth_user

  # def auth_user
  #   redirect_to new_admin_session_path unless admin_signed_in?
  # end

  def show
    @mod_id = params[:id]
    @man = ToType.find(@mod_id)#.find(:all, conditions: {:TYP_MOD_ID => @mod_id}, order: "Name ASC")
    # render :layout => 'admin'
  end

  def edit
    @man = ToType.find(params[:id])
    # render :layout => 'admin'
  end

  def update
    @man = ToType.find(params[:id])
    if @mod.update_attributes(params[:to_type])
      redirect_to admin_catalog_to_to_type_path(@man.TYP_MOD_ID)
    else
      render :layout => 'admin'
    end
  end

  def new
    @man = ToType.new
    @mod_id = params[:mod_id]
    # render :layout => 'admin'
  end

  def create
    @man = ToType.new(params[:to_type])
    # @mod_id = params[:mod_id]
    # @man.TYP_MOD_ID = @mod_id
    logger.debug "----#{@man}"
    if @man.save
    logger.debug "----#{@man.errors.inspect}"
      redirect_to admin_catalog_to_to_type_path(@man)#@mod_id)
    else
      render 'new'
      # render :layout => 'admin'
    end
  end

  def destroy
    @man = ToType.find(params[:id])
    if @man.destroy
      redirect_to admin_catalog_to_to_type_path(@man.TYP_MOD_ID)
    else
      render :layout => 'admin'
    end
  end
end