class LpsController < ApplicationController
  def index
    @lps = Lp.all
  end

  def show
  end
end
