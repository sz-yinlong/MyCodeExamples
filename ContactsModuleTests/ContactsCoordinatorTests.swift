//
//  ContactsCoordinatorTests.swift
//  PowerBankTests
//
//  Created by ARTEM BARIEV on 16.10.2023.
//

import Quick
import Nimble
@testable import PowerBank

final class ContactsCoordinatorTests: QuickSpec {
    
    override class func spec() {
        
        var routerMock: RouterMock!
        var builder: BuildsContactsMock!
        var coordinator: ContactsCoordinator!
        var interactor: ContactsInteractorMock!
        
        beforeEach {
            routerMock = RouterMock(rootController: UINavigationController())
            builder = BuildsContactsMock()
            coordinator = ContactsCoordinator(router: routerMock, builder: builder)
            interactor = ContactsInteractorMock()
        }
        
        describe(".start") {
            context("when buildContactsModule returns ContactsViewController") {
                it("should call setRootModule") {
                    // given
                    builder.stubbedBuildContactsModuleResult = ContactsViewController(interactor: interactor)
                    
                    // when
                    coordinator.start()
                    
                    // then
                    expect(routerMock.setRootModuleCalled).to(equal(1))
                }
                context("when buildContactsModule does not return ContactsViewController") {
                    it("should not call setRootModule") {
                        // given
                        builder.stubbedBuildContactsModuleResult = UIViewController()
                        
                        // when
                        coordinator.start()
                        
                        // then
                        expect(routerMock.setRootModuleCalled).to(equal(0))
                    }
                }
            }
        }
    }
}
