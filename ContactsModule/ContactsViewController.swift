//
//  ContactsViewController.swift
//  Created by Artem Bariev on 26.09.2023.
//

import UIKit

// MARK: - Protocols
protocol ContactsDisplayLogic: AnyObject {
    func displayData(viewModel: ContactsModel.ViewModel)
}

final class ContactsViewController: UIViewController, ContactsDisplayLogic {
    
    private let interactor: ContactsBusinessLogic
    private let contactsContainerView = ContactsContainerView()
    
    // MARK: - Initializers
    init(interactor: ContactsBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods
    override func loadView() {
        view = contactsContainerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = R.string.localizable.contacts()
        self.navigationItem.title = R.string.localizable.contactCenterPhones()
        contactsContainerView.individualView.delegate = self
        contactsContainerView.corporateView.delegate = self
        loadData()
    }
    
    func loadData() {
        interactor.loadData()
    }
    
    // MARK: - DisplayLogic
    func displayData(viewModel: ContactsModel.ViewModel) {
        contactsContainerView.configure(viewModel: viewModel)
    }
}
// MARK: - ContactViewDelegate
extension ContactsViewController: ContactsViewDelegate {
    func didTapPhoneNumber(phoneNumber: String) {
        interactor.makePhoneCall(phoneNumber: phoneNumber)
    }
}
