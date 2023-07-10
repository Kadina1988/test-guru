# frozen_string_literal: true


class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show start edit update destroy update_inline]

  def index; end

  def show; end

  def new
    @test = current_user.created_tests.new
  end

  def create
    @test = current_user.created_tests.build(test_params)

    if @test.save
      redirect_to admin_tests_path, notice: t('.succes')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def set_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :timer)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end

