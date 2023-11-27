//
//  ContactsCoordinator.swift
//  Created by ARTEM BARIEV on 03.10.2023.
//
import Foundation

final class ContactsCoordinator: Coordinatable {
    var finish: (() -> Void)?
    
    private let builder: BuildsContacts
    private let router: Routable
    
    init(router: Routable, builder: BuildsContacts) {
        self.router = router
        self.builder = builder
    }
    
    func start() {
        guard let view = builder.buildContactsModule() as? ContactsViewController else { return }
        router.setRootModule(view, hideBar: false)
    }
}
