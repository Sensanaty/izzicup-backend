class PartsController < ApplicationController
  before_action :set_part, only: [:show, :update, :destroy]
  after_action { pagy_headers_merge(@pagy) if @pagy }

  def index
    @pagy, @parts = pagy(Part.all)

    render json: { parts: @parts, pagy: pagy_metadata(@pagy) }
  end

  def show
    render json: @part
  end

  def create
    @part = Part.new(part_params)

    if @part.save
      render json: @part, status: :created, location: @part
    else
      render json: @part.errors, status: :unprocessable_entity
    end
  end

  def update
    if @part.update(part_params)
      render json: @part
    else
      render json: @part.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @part.destroy
  end

  private
  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit!
  end
end
