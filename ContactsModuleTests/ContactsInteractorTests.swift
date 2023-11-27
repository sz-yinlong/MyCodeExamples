//
//  ContactsInteractorTests.swift
//  PowerBankTests
//
//  Created by ARTEM BARIEV on 16.10.2023.
//

import Quick
import Nimble
@testable import PowerBank

final class ContactsInteractorTests: QuickSpec {
    override class func spec() {
        
        var interactor: ContactsInteractor!
        var presenter: ContactsPresenterMock!
        
        beforeEach {
            presenter = ContactsPresenterMock()
            interactor = ContactsInteractor(presenter: presenter)
        }
        
        describe(".loadData") {
            it("should load data and call presentation logic") {
                // when
                interactor.loadData()
                
                // then
                expect(presenter.isPresentationDataCalled).to(equal(1))
            }
        }
    }
}
