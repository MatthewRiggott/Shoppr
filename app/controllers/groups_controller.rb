class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @group  = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @grocery_lists = GroceryList.where :group_id => @group.id
    @grocery_list = GroceryList.new
  end

  def create
    @group  = Group.new(group_params)

    if @group.save
      flash[:notice] = "Group added."
      redirect_to root_path
    else
      @groups = Group.all
      render :index
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to root_path
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
