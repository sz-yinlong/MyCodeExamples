//
//  ContactsViewControllerTests.swift
//  PowerBankTests
//
//  Created by ARTEM BARIEV on 26.09.2023.
//

import Quick
import Nimble
@testable import PowerBank

final class ContactsViewControllerTests: QuickSpec {
    
    override class func spec() {
        
        var viewController: ContactsViewController!
        var interactorMock: ContactsInteractorMock!
        
        beforeEach {
            interactorMock = ContactsInteractorMock()
            viewController = ContactsViewController(interactor: interactorMock)
            _ = viewController.view
        }
        
        describe(".viewDidLoad") {
            context("when view is loaded") {
                it("should call loadData on interactor") {
                    // then
                    expect(interactorMock.isLoadDataCalled).to(equal(1))
                }
            }
        }
        describe(".didTapPhoneNumber") {
            context("when phone number is tapped") {
                it("should recieve correct phone number in delegate method") {
                    // given
                    let expectedPhoneNumber = DataForTest.testphoneNumber
                    
                    // when
                    viewController.didTapPhoneNumber(phoneNumber: expectedPhoneNumber)
                    
                    // then
                    expect(interactorMock.recievedPhoneNumber).to(equal(expectedPhoneNumber))
                }
            }
        }
    }
}
private extension ContactsViewControllerTests {
    enum DataForTest {
        static let testphoneNumber = "1234567890"
    }
}
