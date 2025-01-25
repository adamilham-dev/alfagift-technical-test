//
//  APIManager.swift
//  student
//
//  Created by Adam on 24/01/25.
//

import Foundation
import Alamofire

class APIManager {
    static let shared = APIManager()
    
    private let mockAddresses = [
        "123 Main St, Springfield",
        "456 Elm St, Shelbyville",
        "789 Oak St, Ogdenville",
        "101 Maple St, North Haverbrook",
        "202 Pine St, Brockway",
        "303 Cedar St, Springfield",
        "404 Birch St, Shelbyville",
        "505 Walnut St, Ogdenville",
        "606 Willow St, North Haverbrook",
        "707 Chestnut St, Brockway"
    ]
    
    func fetchStudents(completion: @escaping (Result<[Student], Error>) -> Void) {
        let url = "https://reqres.in/api/users?page=1&per_page=10"
        
        AF.request(url).validate().responseDecodable(of: Response.self) { response in
            switch response.result {
            case .success(let decodedResponse):
                // Step 1: Decode into BaseStudent
                let baseStudents = decodedResponse.data
                
                // Step 2: Inject mock addresses
                let studentsWithAddress = baseStudents.enumerated().map { index, baseStudent in
                    Student(
                        id: baseStudent.id,
                        first_name: baseStudent.first_name,
                        last_name: baseStudent.last_name,
                        email: baseStudent.email,
                        avatar: baseStudent.avatar,
                        address: self.mockAddresses[index % self.mockAddresses.count]
                    )
                }
                
                // Step 3: Save students to local storage
                StudentStorageManager.shared.saveStudents(studentsWithAddress)
                
                // Step 4: Return students
                completion(.success(studentsWithAddress))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

// Response Model
struct Response: Decodable {
    let data: [BaseStudent]
}
