//
//  StudentModel.swift
//  student
//
//  Created by Adam on 24/01/25.
//

struct Student: Codable {
    let id: Int
    let first_name: String
    let last_name: String
    let email: String
    let avatar: String
    let address: String
}

struct BaseStudent: Codable {
    let id: Int
    let first_name: String
    let last_name: String
    let email: String
    let avatar: String
}
