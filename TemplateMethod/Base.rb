class Base
  def titulo
    raise 'Precisa ser implementado'
  end

  def descricao
    raise 'Precisa ser implementado'
  end

  def beneficios
    raise 'Precisa ser implementado'
  end

  def output
    output = <<-STRING
      Titulo: #{titulo}
      Descricao: #{descricao}
      Beneficios do plano: #{beneficios}.
    STRING

    puts(output)
  end
end

