require_relative 'PlanoBasico.rb' 
require_relative 'PlanoPremium.rb' 

planoBasico01 = BasicPlan.new();
puts planoBasico01.titulo();
puts planoBasico01.beneficios();
puts planoBasico01.descricao();

planoPremium01 = PremiumPlan.new();
puts planoPremium01.titulo();
puts planoPremium01.beneficios();
puts planoPremium01.descricao();