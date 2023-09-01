class HomeController < ApplicationController
  def index
    @extrato = Caixa.all
  end
end
