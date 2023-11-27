//
//  ContactsBuilderTests.swift
//  PowerBankTests
//
//  Created by ARTEM BARIEV on 17.10.2023.
//

import Quick
import Nimble
@testable import PowerBank

final class ContactsBuilderTests: QuickSpec {
    override class func spec() {
        
        var builder: ContactsBuilder!
        
        beforeEach {
            builder = ContactsBuilder()
        }
        
        describe(".build") {
            it("should return ContactsViewController instance") {
                // when
                let viewController = builder.build()
                
                // then
                expect(viewController).to(beAnInstanceOf(ContactsViewController.self))
            }
        }
    }
}
