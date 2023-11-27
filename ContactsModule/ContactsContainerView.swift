//
//  ContactsContainerView.swift
//  PowerBank
//
//  Created by ARTEM BARIEV on 09.10.2023.
//

import UIKit
import SnapKit

final class ContactsContainerView: UIView {
    
    let individualView = ContactsView()
    let corporateView = ContactsView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = Constants.gapBetweenViews
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.systemBackground
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        stackView.addArrangedSubviews([individualView, corporateView])
        addSubview(stackView)
    }
    
    private func makeConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(Constants.topOffset)
            make.leading.trailing.equalToSuperview().inset(Constants.trailingLeading)
        }
        
        individualView.snp.makeConstraints { make in
            make.height.equalTo(Constants.heigthIndividual)
        }
        
        corporateView.snp.makeConstraints { make in
            make.height.equalTo(Constants.heightCorporate)
        }
    }
}

extension ContactsContainerView: ViewModelConfigurable {
    
    typealias ViewModel = ContactsModel.ViewModel
    
    func configure(viewModel: ContactsModel.ViewModel) {
        individualView.configure(viewModel: viewModel.contacts[0])
        corporateView.configure(viewModel: viewModel.contacts[1])
    }
    
    enum Constants {
        static let topOffset: CGFloat = 50
        static let safeAreaOffset: CGFloat = 37
        static let trailingLeading: CGFloat = 16
        static let heigthIndividual: CGFloat = 90
        static let gapBetweenViews: CGFloat = 16
        static let heightCorporate: CGFloat = 106
    }
}
