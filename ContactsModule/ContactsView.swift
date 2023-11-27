//
//  ContactsView.swift
//  PowerBank
//
//  Created by ARTEM BARIEV on 15.10.2023.
//

import UIKit
import SnapKit

protocol ContactsViewDelegate: AnyObject {
    func didTapPhoneNumber(phoneNumber: String)
}

final class ContactsView: UIView {
    
    var delegate: ContactsViewDelegate?
    
    // MARK: - Private Properties
    private lazy var phoneIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.phoneString)
        imageView.tintColor = R.color.secondary()
        return imageView
    }()
    
    private  lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.color.text1()
        label.font = .systemFont(ofSize: Constants.mainLabelFontSize)
        return label
    }()
    
    private lazy var numberButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(R.color.secondary(), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Constants.mainLabelFontSize, weight: .medium)
        button.addTarget(self, action: #selector(didTapPhoneNumber), for: .touchUpInside)
        button.contentEdgeInsets = Constants.buttonInsets
        
        return button
    }()
    
    private lazy var workingTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constants.secondaryLabelFontSize)
        label.textColor = R.color.text2()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTapPhoneNumber))
        return recognizer
    }()
    
    @objc private func didTapPhoneNumber() {
        guard let phoneNumber = numberButton.titleLabel?.text else {
            return
        }
        delegate?.didTapPhoneNumber(phoneNumber: phoneNumber)
    }
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        self.backgroundColor = R.color.white()
        self.layer.cornerRadius = Constants.cornerRadius
        addSubviews()
        makeConstraints()
        addShadow(to: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Add Subviews
    private func addSubviews() {
        addSubviews([phoneIconImageView, mainLabel, numberButton, workingTimeLabel])
    }
    
    // MARK: - Constraints
    private func makeConstraints() {
        phoneIconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.primaryOffset)
            make.centerY.equalTo(mainLabel)
            make.width.height.equalTo(Constants.iconOffset)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.primaryOffset)
            make.leading.equalTo(phoneIconImageView.snp.trailing).offset(Constants.primaryOffset)
        }
        
        numberButton.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(Constants.secondaryOffset)
            make.leading.equalTo(mainLabel)
        }
        
        workingTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(numberButton.snp.bottom).offset(Constants.secondaryOffset)
            make.leading.equalTo(mainLabel)
        }
    }
}
// MARK: ViewModelConfigurable
extension ContactsView: ViewModelConfigurable {
   
    typealias ViewModel = ContactsModel.ContactItem
    
    func configure(viewModel: ViewModel) {
        mainLabel.text = viewModel.description
        workingTimeLabel.text = viewModel.time
        numberButton.setTitle(viewModel.phone, for: .normal)
    }
    private func addShadow(to view: UIView) {
        view.layer.shadowColor = R.color.shadow()?.cgColor
        view.layer.shadowOffset = Constants.shadowOffset
        view.layer.shadowOpacity = Constants.shadowOpacity
        view.layer.shadowRadius = Constants.shadowRadius
        view.layer.masksToBounds = false
    }
}
// MARK: - Constants
enum Constants {
    // ints
    static let mainLabelFontSize: CGFloat = 14
    static let secondaryLabelFontSize: CGFloat = 12
    static let primaryOffset: CGFloat = 10
    static let secondaryOffset: CGFloat = 8
    static let iconOffset: CGFloat = 20
    
    // shadow
    static let shadowOffset: CGSize = CGSize(width: 0, height: 1)
    static let shadowOpacity: Float = 1
    static let shadowRadius: CGFloat = 20
    static let cornerRadius: CGFloat = 12
    
    // string
    static let phoneString: String = "phone"
    
    // button
    static let buttonInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0.01, bottom: 0.01, right: 0)
}
