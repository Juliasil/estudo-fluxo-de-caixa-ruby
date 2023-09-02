class HomeController < ApplicationController
  def index
    @extrato = Caixa.all
    @extrato = @extrato.where("tipo like ?", "%#{params[:tipo]}%") if params[:tipo].present?

    @valor_total = 0
    @receita = 0
    @despesa = 0

    @extrato.each do |item|
      if item.status == Caixa::DEBITO
        @despesa += item.valor
      else
        @receita += item.valor
      end
    end
    @valor_total = @receita - @despesa
  end
end