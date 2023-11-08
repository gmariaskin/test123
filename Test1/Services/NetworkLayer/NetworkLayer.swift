//
//  NetworkLayer.swift
//  Test1
//
//  Created by DiOS on 21.10.2023.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case invalidData
}


protocol NetworkLayerProtocol {
    func fetchDate(url: URL, completion: @escaping (Result<[Employee], Error>) -> Void)
}

class NetworkLayer: NetworkLayerProtocol {
    static let shared = NetworkLayer()
    private init() {}
    
//    typealias test =

    
    func fetchDate(url: URL, completion: @escaping (Result<[Employee], Error>) -> Void) {
        AF.request(url).validate().responseDecodable(of: [Employee].self) { response in
            switch response.result {
            case .success(let employees):
                if let jsonArray = employees as? [[String: Any]] {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: jsonArray)
                        let employees = try JSONDecoder().decode([Employee].self, from: jsonData)
                        completion(.success(employees))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    let error = NSError(domain: "Invalid response format", code: 0)
                    completion(.failure(error))
                }
                completion(.success(employees))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

class NetworkService {
    
    func fetchDataAsync<T: Decodable>(from url: URL, modelType: T.Type) async throws -> [T] {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let parsedData = try decoder.decode([T].self, from: data)
            return parsedData
        } catch {
            throw NetworkError.invalidData
        }
    }
}
//
//// MARK: - Employee
//struct Employee: Codable {
//    let status: String
//    let data: [Datum]
//    let message: String
//}
//
//// MARK: - Datum
//struct Datum: Codable {
//    let id: Int
//    let employeeName: String
//    let employeeSalary, employeeAge: Int
//    let profileImage: String
//    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case employeeName = "employee_name"
//        case employeeSalary = "employee_salary"
//        case employeeAge = "employee_age"
//        case profileImage = "profile_image"
//    }
//}
