class StoriesController < ApplicationController

  def index
    if params[:user_id] == nil
    @stories = Story.all
      @story = Story.new
    render('stories/all_index.html.erb')
    else
    @user = User.find(params[:user_id])
      @story = Story.new
    end
  end

  def new
    @story = Story.new
    @user = User.find(current_user)
  end

  def show
    @user = User.find(current_user)
    @story = Story.find(params[:id])
  end

  def create
      @user = User.find(params[:user_id])
      @story = Story.create(story_params)
      if @story.valid?
        flash[:notice] = "Your story has been added."
        redirect_to root_path
      else
        render 'new'
      end
  end

  def edit
    @story = Story.find(params[:id])
  end
  
  def search
    @stories = []
    @stories << Story.story_search(params[:q])
    @stories = @stories.flatten
  end

  def update
    @story = Story.find(params[:id])
    @user = User.find(current_user)
    if @story.update(story_params)
    flash[:notice] = "Your story has been updated"
    redirect_to root_path
    else
      flash[:notice] = "Your input was invalid"
      redirect_to edit_user_story_path({:user_id => @user.id, :id => @story.id})
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    flash[:notice] = "Your story has been deleted"
    redirect_to root_path
  end


  private
  def story_params
    params.require(:story).permit(:title, :content, :user_id)
  end

end
