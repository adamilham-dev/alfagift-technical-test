//
//  SplashViewController.swift
//  student
//
//  Created by Adam on 25/01/25.
//

import UIKit

class SplashViewController: UIViewController {
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startTransition()
    }

    private func setupUI() {
        view.backgroundColor = .white // Set background color to white
        view.addSubview(logoImageView)

        // Center the logo in the view
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200), // Adjust width as needed
            logoImageView.heightAnchor.constraint(equalToConstant: 200) // Adjust height as needed
        ])
    }

    private func startTransition() {
        // Transition to the main app after 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let mainVC = LoginViewController()
            let navigationController = UINavigationController(rootViewController: mainVC)
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true)
        }
    }
}
