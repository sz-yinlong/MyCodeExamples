//
//  ContactsCoordinatorMock.swift
//  PowerBankTests
//
//  Created by ARTEM BARIEV on 17.10.2023.
//

@testable import PowerBank

final class ContactsCoordinatorMock: Coordinatable {
    
    var finish: (() -> Void)?
    
    var startWasCalled: Int = 0
    
    func start() {
        startWasCalled = 1
    }
}
