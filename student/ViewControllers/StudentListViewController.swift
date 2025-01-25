//
//  StudentListViewController.swift
//  student
//
//  Created by Adam on 24/01/25.
//

import UIKit

class StudentListViewController: UIViewController, UITableViewDataSource {
    private var students: [Student] = []

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(StudentCell.self, forCellReuseIdentifier: StudentCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchStudentData()
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "Students"
        navigationController?.navigationBar.prefersLargeTitles = true

        view.addSubview(tableView)
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func fetchStudentData() {
        students = StudentStorageManager.shared.fetchStudents()
        if students.isEmpty {
            APIManager.shared.fetchStudents { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let apiStudents):
                        self?.students = apiStudents
                        self?.tableView.reloadData()
                    case .failure(let error):
                        self?.showError(error: error)
                    }
                }
            }
        } else {
            tableView.reloadData()
        }
    }
    
    private func showError(error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StudentCell.identifier, for: indexPath) as! StudentCell
        let student = students[indexPath.row]
        cell.configure(with: student)
        return cell
    }
}
