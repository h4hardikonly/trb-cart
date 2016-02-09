class ProductsController < ApplicationController
  def new
    form Product::Create
  end

  def create
    @thing = Thing.find(params[:thing_id]) # UI-specific logic!

    run Comment::Create do |op|
      flash[:notice] = "Created comment for \"#{op.thing.name}\""

      return redirect_to thing_path(op.thing)
    end

    render :new
  end
end
