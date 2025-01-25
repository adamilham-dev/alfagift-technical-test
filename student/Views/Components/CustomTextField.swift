//
//  CustomTextField.swift
//  student
//
//  Created by Adam on 24/01/25.
//

import UIKit

class CustomTextField: UIView {
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray
        return imageView
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    init(icon: UIImage?, placeholder: String, labelText: String) {
        super.init(frame: .zero)
        setupView(icon: icon, placeholder: placeholder, labelText: labelText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(icon: UIImage?, placeholder: String, labelText: String) {
        label.text = labelText
        textField.placeholder = placeholder
        iconImageView.image = icon
        
        addSubview(label)
        addSubview(iconImageView)
        addSubview(textField)
        addSubview(bottomLine)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Label constraints
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            
            // Icon constraints
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconImageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            // TextField constraints
            textField.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12), // Increased spacing
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 24),
            
            // Bottom line constraints
            bottomLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomLine.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 8),
            bottomLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func getTextField() -> UITextField {
        return textField
    }
}
