class Plan
  attr_reader :titulo, :descricao, :beneficios

  def initialize(tipo)
    if tipo == :basico
      @titulo = "Plano básico."
      @descricao = "Uma descrição para um plano básico."
      @beneficios = ['É grátis', 'Acesso a conta básica', 'Outros beneficios']
    elsif kind == :premium
      @title = "Plano Premium"
      @description = "Uma descrição para um plano Premium."
      @benefits = ['Tem que pagar', 'Acesso full', 'Premium features', 'Acesso vitalico']
    else
      @titulo = "Outro plano"
      @descricao = "Uma descricao para outro plano"
      @beneficios = ['Sem beneficios']
    end
  end

  def output
    output = <<-STRING
      Title: #{titulo}
      Description: #{descricao}
      Plan benefits: #{beneficios.join(', ')}.
    STRING

    puts(output)
  end
end



basic = Plan.new(:basico)
basic.output

"""
Title: I'm the basic plan
Description: My description of basic plan
Plan benefits: It is free, Access to one account, Basic features.
"""

other_plan = Plan.new(:outro)
other_plan.output

"""
Title: I'm the other plan
Description: My description of other plan
Plan benefits: No benefits.
"""