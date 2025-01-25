//
//  StudentStorageManager.swift
//  student
//
//  Created by Adam on 25/01/25.
//

import Foundation

class StudentStorageManager {
    private let storageKey = "students"

    static let shared = StudentStorageManager()
    
    private init() {}
    
    // MARK: - Create or Add a Student
    func addStudent(_ student: Student) {
        var students = fetchStudents()
        students.append(student)
        saveStudents(students)
    }

    // MARK: - Read or Fetch All Students
    func fetchStudents() -> [Student] {
        guard let data = UserDefaults.standard.data(forKey: storageKey) else {
            return []
        }
        return (try? JSONDecoder().decode([Student].self, from: data)) ?? []
    }

    // MARK: - Update a Student
    func updateStudent(_ updatedStudent: Student) {
        var students = fetchStudents()
        if let index = students.firstIndex(where: { $0.id == updatedStudent.id }) {
            students[index] = updatedStudent
            saveStudents(students)
        }
    }

    // MARK: - Delete a Student
    func deleteStudent(withId id: Int) {
        var students = fetchStudents()
        students.removeAll { $0.id == id }
        saveStudents(students)
    }

    // MARK: - Save Students to UserDefaults
    func saveStudents(_ students: [Student]) {
        if let data = try? JSONEncoder().encode(students) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
}
