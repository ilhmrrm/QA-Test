describe('input form website rpachallenge', () => {
    beforeEach(() => {
        cy.visit('https://rpachallenge.com/')
    })

    it('Verify Succes access web', () => {
        cy.get('.btn-large').click()
        // cy.get('#fIsif').type('apalah')
        for (let i = 0; i < 10; i++) {
            cy.get('form.ng-pristine > .btn').click()

            cy.get('body').then(($body) => {
                if ($body.find('.message1').length > 0) {
                    cy.log('Message ".message1"')
                    return;
                }
            })
        }
    })
})