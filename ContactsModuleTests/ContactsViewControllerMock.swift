//
//  ContactsViewControllerMock.swift
//  PowerBankTests
//
//  Created by ARTEM BARIEV on 17.10.2023.
//
@testable import PowerBank

final class ContactsViewControllerMock: ContactsDisplayLogic, ContactsViewDelegate {
    
    private (set) var displayDataCalled: Int = 0
    private (set) var recievedViewModel: ContactsModel.ViewModel?
    
    func displayData(viewModel: ContactsModel.ViewModel) {
        displayDataCalled += 1
        recievedViewModel = viewModel
    }
    
    private (set) var didTapPhoneNumberWasCalled: Int = 0
    private (set) var recievedPhoneNumber: String = "1234567890"
    
    func didTapPhoneNumber(phoneNumber: String) {
        didTapPhoneNumberWasCalled += 1
        recievedPhoneNumber = phoneNumber
    }
}
