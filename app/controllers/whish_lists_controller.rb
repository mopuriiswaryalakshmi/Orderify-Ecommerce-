class WhishListsController < ApplicationController
  before_action :set_whish_list, only: [:show, :edit, :update, :destroy]

  # GET /whish_lists
  # GET /whish_lists.json
  def index
    @whish_lists = WhishList.where('user_id=?',current_user.id)
  end

  # GET /whish_lists/1
  # GET /whish_lists/1.json
  def show
  end

  # GET /whish_lists/new
  def new
    @whish_list = WhishList.new
  end

  # GET /whish_lists/1/edit
  def edit
  end

  # POST /whish_lists
  # POST /whish_lists.json
  def create
    @whish_list = WhishList.new(whish_list_params)
    @whish_list.user_id = current_user.id
      if WhishList.find_by_user_id_and_product_id(@whish_list.user_id,@whish_list.product_id)
       redirect_to whish_lists_path, notice: "Product alerady in whishlist" 
      else
       @whish_list.save
       redirect_to whish_lists_path, notice: "successfully Added to WhishList"
      end
  end
    

  # PATCH/PUT /whish_lists/1
  # PATCH/PUT /whish_lists/1.json
  def update
    respond_to do |format|
      if @whish_list.update(whish_list_params)
        format.html { redirect_to @whish_list, notice: 'Whish list was successfully updated.' }
        format.json { render :show, status: :ok, location: @whish_list }
      else
        format.html { render :edit }
        format.json { render json: @whish_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /whish_lists/1
  # DELETE /whish_lists/1.json
  def destroy
    @whish_list.destroy
    respond_to do |format|
      format.html { redirect_to whish_lists_url, notice: 'Whish list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_whish_list
      @whish_list = WhishList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def whish_list_params
      params.require(:whish_list).permit(:user_id, :product_id)
    end
end
