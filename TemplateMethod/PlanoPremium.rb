require_relative 'Base.rb'

class PremiumPlan < Base
  def titulo
    "Plano Premium"
  end

  def descricao
    "Uma descrição para um plano Premium."
  end

  def beneficios
    ['Tem que pagar', 'Acesso full', 'Premium features', 'Acesso vitalico'].join(', ')
  end
end
