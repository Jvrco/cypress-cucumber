Feature: Restaurants

Scenario: deletar restaurante cadastrado 
        Given eu estou logado com email "ze@gmail.com" e senha "#Senha123"
        Given  eu estou na página "http://localhost:3000/restaurants/update/65f12c896361125892238042"
        Given eu vejo "Ta San Yuen" no campo de nome do restaurante
        Given eu vejo "Quarenta e Oito, 144 - Cidade Universitária, Recife" nos campos de endereço
        When eu clico em "#delete-button"
        Then eu vejo a mensagem "O restaurante foi deletado com sucesso"

Scenario: cadastrar restaurante novo
        Given eu estou logado com email "ze@gmail.com" e senha "#Senha123"
        And eu estou na página "http://localhost:3000/restaurants/create"
        And o restaurante "Marcelinho Salgados" com endereço "Av. Jorn. Aníbal Fernandes, 150 - Cidade Universitária, Recife" não está cadastrado no site
        When eu defino o nome do restaurante como "Marcelinho Salgados"
        And eu defino o endereço como "Av. Jorn. Aníbal Fernandes, 150 - Cidade Universitária, Recife"
        And eu defino o tipo de comida como "salgados"
        And eu clico em "#create-button"
        Then eu vejo a mensagem "O restaurante foi cadastrado com sucesso"
        And eu clico em "#cancelBtn"
        And eu vejo "Marcelinho Salgados" como nome do restaurante
        And eu vejo "salgados" como tipo de comida
        And eu vejo "Av. Jorn. Aníbal Fernandes, 150 - Cidade Universitária, Recife" como endereço

Scenario: cadastrar restaurante repetido
        Given eu estou logado com email "ze@gmail.com" e senha "#Senha123"
        Given eu estou na página "http://localhost:3000/restaurants/create"
        And o restaurante "Rainha da Várzea" com endereço "Av. Afonso Olindense, 2088 - Várzea, Recife" já está cadastrada no site
        And eu defino o nome do restaurante como "Rainha da Várzea"
        And eu defino o endereço como "Av. Afonso Olindense, 2088 - Várzea, Recife"
        And eu defino o tipo de comida como  "Panificação"
        When eu clico em "#create-button"
        Then eu vejo a mensagem "ERRO: não foi possível cadastrar o restaurante"

Scenario: editar restaurante cadastrado
    Given eu estou logado com email "ze@gmail.com" e senha "#Senha123"
    And eu estou na página "http://localhost:3000/restaurants/update/321"
    And eu vejo "Macunaíma" no campo de nome do restaurante
    And eu vejo "Confeitaria" no campo de tipo de comida
    When eu defino o tipo de comida como "Creperia"
    And eu clico em "#create-button"
    Then eu vejo a mensagem "O restaurante foi editado com sucesso"
    When eu clico em "#cancelBtn"
    Then  o usuário é redirecionado para a página "restaurants/321"
    And eu vejo "Macunaíma" como nome do restaurante
    And eu vejo "Creperia" como tipo de comida

        
