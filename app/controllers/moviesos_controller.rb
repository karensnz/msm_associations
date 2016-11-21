class MoviesosController < ApplicationController
  def index
    @moviesos = Movieso.all

    render("moviesos/index.html.erb")
  end

  def show
    @movieso = Movieso.find(params[:id])

    render("moviesos/show.html.erb")
  end

  def new
    @movieso = Movieso.new

    render("moviesos/new.html.erb")
  end

  def create
    @movieso = Movieso.new

    @movieso.source = params[:source]
    @movieso.caption = params[:caption]
    @movieso.image_url = params[:image_url]

    save_status = @movieso.save

    if save_status == true
      redirect_to("/moviesos/#{@movieso.id}", :notice => "Movieso created successfully.")
    else
      render("moviesos/new.html.erb")
    end
  end

  def edit
    @movieso = Movieso.find(params[:id])

    render("moviesos/edit.html.erb")
  end

  def update
    @movieso = Movieso.find(params[:id])

    @movieso.source = params[:source]
    @movieso.caption = params[:caption]
    @movieso.image_url = params[:image_url]

    save_status = @movieso.save

    if save_status == true
      redirect_to("/moviesos/#{@movieso.id}", :notice => "Movieso updated successfully.")
    else
      render("moviesos/edit.html.erb")
    end
  end

  def destroy
    @movieso = Movieso.find(params[:id])

    @movieso.destroy

    if URI(request.referer).path == "/moviesos/#{@movieso.id}"
      redirect_to("/", :notice => "Movieso deleted.")
    else
      redirect_to(:back, :notice => "Movieso deleted.")
    end
  end
end
