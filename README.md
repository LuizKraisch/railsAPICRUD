# Rails API CRUD

Uma pequeno CRUD em API feito em Ruby on Rails.

## Adicionando testes de mutação

Feito por [Luiz Kraisch](https://github.com/luizkraisch) e [Gabriela Liz](https://github.com/gabiliz).

Para uma atividade curricular, foram adicionados teste de mutação neste repositório. Os testes foram disponibilizados a partir da gem (pacote de código) `mutant-rspec` do Ruby. A gem foi adicionada ao `Gemfile` da aplicação da seguinte forma:

`gem 'mutant-rspec', '~> 0.8.24', require: false`

Com isso, a plataforma de testes unitários RSpec consegue lidar com testes de integração de forma mais natural. Todos os controllers da aplicação tiverem testes de mutação aplicados.

#### Sites utiizados como exemplo

https://rubygems.org/gems/mutant-rspec/versions/0.8.8. 

https://nebulab.com/blog/an-introduction-to-mutation-testing. 

https://cs.gmu.edu/~nli1/rubyMutation.pdf. 

