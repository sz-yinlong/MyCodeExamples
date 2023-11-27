//
//  ContactsPresenterTests.swift
//  PowerBankTests
//
//  Created by Artem on 25.10.2023.
//
import Quick
import Nimble
@testable import PowerBank

final class ContactsPresenterTests: QuickSpec {
    override class func spec() {
        
        var presenter: ContactsPresenter!
        var viewControllerMock: ContactsViewControllerMock!
        
        beforeEach {
            viewControllerMock = ContactsViewControllerMock()
            presenter = ContactsPresenter()
            presenter.viewController = viewControllerMock
        }
        
        describe(".presentationData") {
            context("when presentation data is called") {
                it("should call displayData from viewController") {
                    // when
                    presenter.presentationData()
                    
                    // then
                    expect(viewControllerMock.displayDataCalled).to(equal(1))
                }
                it("should return correct ViewModel") {
                    // when
                    presenter.presentationData()
                    let resultViewModel = viewControllerMock.recievedViewModel
                    
                    // expect
                    expect(resultViewModel).to(equal(DataForTest.viewModel))
                }
            }
        }
    }
}
private extension ContactsPresenterTests {
    enum DataForTest {
        static let firstTestContact = ContactsModel.ContactItem(
            description: "Individual",
            phone: "8 800 675 01 45",
            time: "Weekdays from 08:00 to 20:00"
        )
        static let secondTestContact = ContactsModel.ContactItem(
            description: "Corporate",
            phone: "8 800 777 55 33",
            time: "Weekdays from 08:00 to 20:00.\nWeekends and holidays from 08:00 to 17:00"
        )
        static let viewModel = ContactsModel.ViewModel(contacts: [firstTestContact, secondTestContact])
    }
}
