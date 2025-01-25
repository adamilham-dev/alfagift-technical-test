//
//  LoginViewController.swift
//  student
//
//  Created by Adam on 24/01/25.
//

import UIKit
import RAGTextField

class LoginViewController: UIViewController {

    // Illustration image
    private let illustrationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "illustration") // Replace with your actual image name
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // Title and subtitle
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome Back,"
        label.font = UIFont(name: "AvenirNext-Bold", size: 28)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Log in now to continue"
        label.font = UIFont(name: "AvenirNext-Regular", size: 16)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Username field
    private let usernameField: RAGTextField = {
        let field = RAGTextField()
        let bgView = OutlineView(frame: .zero)
        bgView.lineWidth = 1 // Increased line thickness for better visibility
        bgView.lineColor = .systemBlue // Changed to a more visible color
        bgView.fillColor = UIColor.systemBlue.withAlphaComponent(0.1) // Light blue background
        bgView.cornerRadius = 8.0
        field.textBackgroundView = bgView
        field.textPadding = UIEdgeInsets(top: 10.0, left: 12.0, bottom: 10.0, right: 12.0)
        field.textPaddingMode = .text
        field.placeholderMode = .scalesWhenEditing
        field.placeholderScaleWhenEditing = 0.6
        field.placeholder = "Username"
        field.placeholderColor = .systemBlue // Matches the line color for consistency
        field.textColor = .systemBlue // Text is clearly visible
        field.tintColor = .systemBlue
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    // Password field
    private let passwordField: RAGTextField = {
        let field = RAGTextField()
        let bgView = OutlineView(frame: .zero)
        bgView.lineWidth = 1 // Increased line thickness for better visibility
        bgView.lineColor = .systemBlue // Changed to a more visible color
        bgView.fillColor = UIColor.systemBlue.withAlphaComponent(0.1) // Light blue background
        bgView.cornerRadius = 8.0
        field.textBackgroundView = bgView
        field.textPadding = UIEdgeInsets(top: 10.0, left: 12.0, bottom: 10.0, right: 12.0)
        field.textPaddingMode = .text
        field.placeholderMode = .scalesWhenEditing
        field.placeholderScaleWhenEditing = 0.6
        field.placeholder = "Password"
        field.placeholderColor = .systemBlue // Matches the line color for consistency
        field.textColor = .systemBlue // Text is clearly visible
        field.tintColor = .systemBlue
        field.isSecureTextEntry = true
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    // Login button
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 22
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 16)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }

    private func setupUI() {
        view.backgroundColor = .white
        
        // Add subviews
        view.addSubview(illustrationImageView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)

        // Apply constraints
        NSLayoutConstraint.activate([
            // Illustration image
            illustrationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            illustrationImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            illustrationImageView.widthAnchor.constraint(equalToConstant: 250),
            illustrationImageView.heightAnchor.constraint(equalToConstant: 200),

            // Title
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: illustrationImageView.bottomAnchor, constant: 20),

            // Subtitle
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),

            // Username field
            usernameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 30),
            usernameField.widthAnchor.constraint(equalToConstant: 300),
            usernameField.heightAnchor.constraint(equalToConstant: 50),

            // Password field
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 16),
            passwordField.widthAnchor.constraint(equalToConstant: 300),
            passwordField.heightAnchor.constraint(equalToConstant: 50),

            // Login button
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            loginButton.widthAnchor.constraint(equalToConstant: 300),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func loginTapped() {
        animateButtonTap()
        guard let username = usernameField.text, !username.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            showAlert(message: "Please fill in both fields")
            return
        }

        if username == "alfagift-admin" && password == "asdf" {
            // Navigate to the next screen
            let studentListVC = StudentListViewController()
            let navigationController = UINavigationController(rootViewController: studentListVC)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true)
        } else {
            showAlert(message: "Invalid username or password")
        }
    }

    private func animateButtonTap() {
        UIView.animate(withDuration: 0.1,
                       animations: { self.loginButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95) },
                       completion: { _ in
                           UIView.animate(withDuration: 0.1) {
                               self.loginButton.transform = .identity
                           }
                       })
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
