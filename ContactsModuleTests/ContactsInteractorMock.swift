//
//  ContactsInteractorMock.swift
//  PowerBankTests
//
//  Created by ARTEM BARIEV on 17.10.2023.
//

@testable import PowerBank

final class ContactsInteractorMock: ContactsBusinessLogic {
    
    private (set) var isLoadDataCalled: Int = 0
    
    func loadData() {
        isLoadDataCalled += 1
    }
    
    private (set) var phoneWasCalled: Int = 0
    private (set) var recievedPhoneNumber: String?
    
    func makePhoneCall(phoneNumber: String) {
        phoneWasCalled += 1
        recievedPhoneNumber = phoneNumber
    }
}
