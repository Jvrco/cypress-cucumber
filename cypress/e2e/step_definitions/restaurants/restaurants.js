import {Given, When, Then} from "cypress-cucumber-preprocessor/steps"

function addressSeparation(addr) {
    var regex = /(.+),\s*(\d+)\s*-\s*(.+),\s*(.+)/;
    
    var match = addr.match(regex);
    
    if (match) {
        return {
            street: match[1].trim(),
            number: match[2].trim(),
            neighborhood: match[3].trim(),
            city: match[4].trim()
        };
    } else {
        return null;
    }
}

Given("eu estou logado com email {string} e senha {string}", (email, pass) => {
    
    cy.visit("http://localhost:3000/login")
    cy.get('.input-field1').clear().type(email)
    cy.get('.input-field2').clear().type("aaaA123!")
    cy.get('.loginbutton').click()
})

Given('eu estou na página {string}', (page) => {
    cy.visit(page)
});

Given('eu vejo {string} no campo de nome do restaurante', (restaurantName) => {
    cy.get('#restaurantName').invoke('val').should('contain', restaurantName);
});

Given('eu vejo {string} nos campos de endereço', (restaurantAddress) => {

    let endereco_sep = addressSeparation(restaurantAddress)

    cy.get('#number').invoke('val').should('contain',endereco_sep.number)
    cy.get('#neighborhood').invoke('val').should('contain',endereco_sep.neighborhood)
    cy.get('#city').invoke('val').should('contain',endereco_sep.city)
    cy.get('#street').invoke('val').should('contain',endereco_sep.street)
});

When('eu clico em {string}', (button) => {
    cy.get(button).click();
});

Then('eu vejo a mensagem {string}', (message) => {
    cy.get('.modal-title h1').invoke('text').should('contain', message);
});

////////////////////

Given('eu defino o nome do restaurante como {string}', (restaurantName) => {
    cy.get('#restaurantName').type(restaurantName);
});

Given('o restaurante {string} não está cadastrado no site', () => {
    //
});

Given('eu defino o endereço como {string}', (restaurantAddress) => {

    let endereco_sep = addressSeparation(restaurantAddress)

    cy.get('#number').type(endereco_sep.number)
    cy.get('#neighborhood').type(endereco_sep.neighborhood)
    cy.get('#city').type(endereco_sep.city)
    cy.get('#street').type(endereco_sep.street)
});

Given('eu defino o tipo de comida como {string}', (typeOfFood) => {
    cy.get('[data-cy="typeOfFood"]').type(typeOfFood);
});    

Then('eu vejo {string} como nome do restaurante', (restaurantName) => {
    cy.get('#restaurant-name').invoke('text').should('contain', restaurantName);
});    

Then('eu vejo {string} como tipo de comida', (typeOfFood) => {
    cy.cy.get('[data-cy="typeOfFood"]').invoke('text').should('contain', typeOfFood);
});  

Then('eu vejo {string} como endereço', (restaurantAddress) => {
    cy.get('#number').invoke('text').should('contain',"Endereço: " + restaurantAddress)
});  



