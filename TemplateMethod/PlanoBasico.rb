require_relative 'Base.rb'

class BasicPlan < Base
  def titulo
    "Plano básico."
  end

  def descricao
    "Uma descrição para um plano básico."
  end

  def beneficios
    [
      'É grátis', 'Acesso a conta básica', 'Outros beneficios'
    ].join(', ')
  end
end

