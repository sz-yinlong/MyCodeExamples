//
//  ContactsPresenter.swift
//  PowerBank
//
//  Created by ARTEM BARIEV on 03.10.2023.
//

import Foundation

// MARK: - Protocols
protocol ContactsPresentationLogic: AnyObject {
    func presentationData()
}

// MARK: - ContactsPresenter
final class ContactsPresenter {
    
    weak var viewController: ContactsDisplayLogic?
}

// MARK: - ContactsPresentationLogic
extension ContactsPresenter: ContactsPresentationLogic {
    
    func presentationData() {
        viewController?.displayData(viewModel: buildViewModel())
    }
}

// MARK: - Extension
private extension ContactsPresenter {
    private func buildViewModel() -> ContactsModel.ViewModel {
        return ContactsModel.ViewModel(contacts: [
            .init(description: R.string.localizable.individual(), phone: Constants.corporatePhone, time: R.string.localizable.individualWorkingTime()),
            .init(description: R.string.localizable.corporate(), phone: Constants.individualPhone, time: R.string.localizable.corporateWorkingTime())
        ])
    }
    // MARK: - Constants
    enum Constants {
        static let individualPhone: String = "8 800 777 55 33"
        static let corporatePhone: String = "8 800 675 01 45"
    }
}
