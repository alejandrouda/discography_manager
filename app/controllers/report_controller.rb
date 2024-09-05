class ReportController < ApplicationController
  def report
    @lps = Lp.includes(:artist, songs: :authors).all
  end
end
