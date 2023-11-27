//
//  ContactsBuilder.swift
//  PowerBank
//
//  Created by ARTEM BARIEV on 17.10.2023.
//

import UIKit

final class ContactsBuilder: BuildsModule {
    
    func build(withContext: String? = nil) -> UIViewController {
        
        let presenter = ContactsPresenter()
        let interactor = ContactsInteractor(presenter: presenter)
        let viewController = ContactsViewController(interactor: interactor)
        
        presenter.viewController = viewController
        return viewController
    }
}
