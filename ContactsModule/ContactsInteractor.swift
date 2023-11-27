//
//  ContactsInteractor.swift
//  PowerBank
//
//  Created by ARTEM BARIEV on 03.10.2023.
//

import UIKit

// MARK: - Protocols
protocol ContactsBusinessLogic: AnyObject {
    func loadData()
    func makePhoneCall(phoneNumber: String)
}

final class ContactsInteractor {
    
    private let presenter: ContactsPresentationLogic
    
    init(presenter: ContactsPresentationLogic) {
        self.presenter = presenter
    }
}
// MARK: - ContactsBusinessLogic
extension ContactsInteractor: ContactsBusinessLogic {
    
    func loadData() {
        presenter.presentationData()
    }
    
    func makePhoneCall(phoneNumber: String) {
        guard let phoneURL = URL(string: "tel://\(phoneNumber)") else { return }
        
        if UIApplication.shared.canOpenURL(phoneURL) {
            UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
        }
    }
}
