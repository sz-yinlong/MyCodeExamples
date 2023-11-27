//
//  ContactsModel.swift
//  PowerBank
//
//  Created by ARTEM BARIEV on 20.10.2023.
//

import Foundation

enum ContactsModel {
    
    struct ContactItem: Equatable {
        let description: String
        let phone: String
        let time: String
    }
    
    struct ViewModel: Equatable {
        let contacts: [ContactItem]
    }
}
