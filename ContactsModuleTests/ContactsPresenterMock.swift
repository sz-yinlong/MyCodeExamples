//
//  ContactsPresenterMock.swift
//  PowerBankTests
//
//  Created by ARTEM BARIEV on 16.10.2023.
//

@testable import PowerBank

final class ContactsPresenterMock: ContactsPresentationLogic {
    
    private(set) var isPresentationDataCalled: Int = 0
    
    func presentationData() {
        isPresentationDataCalled += 1
    }
}
