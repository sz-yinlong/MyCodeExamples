//
//  BuildsContactsMock.swift
//  PowerBankTests
//
//  Created by ARTEM BARIEV on 16.10.2023.
//

import UIKit
@testable import PowerBank

final class BuildsContactsMock: BuildsContacts {
    
    var stubbedBuildContactsModuleResult: UIViewController!
    
    func buildContactsModule() -> UIViewController {
        return stubbedBuildContactsModuleResult
    }
}
