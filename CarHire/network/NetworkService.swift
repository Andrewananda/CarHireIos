//
//  NetworkService.swift
//  CarHire
//
//  Created by Andrew Ananda on 19/05/2021.
//

import Foundation
import Alamofire

class NetworkService {
    
    func fetchData<T: Codable>(url: String, method: HTTPMethod, completion: @escaping (Result<T, Errors>) -> Void) {
        
        let endpoint = K.api.baseUrl + url
        
        AF.request(endpoint, method: method, parameters: nil, encoding: JSONEncoding.default, headers: HTTPHeaders.default)
            .validate(statusCode: 200..<300).responseJSON { response in
                
                if let httpUrlResponse = response.response, 200..<300 ~= httpUrlResponse.statusCode {
                    guard let processData = response.data else {
                        completion(.failure(Errors.emptyResponse))
                        return
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        decoder.dataDecodingStrategy = .base64
                        completion(.success(try decoder.decode(T.self, from: processData)))
                    } catch(let error) {
                        print(T.self)
                        completion(.failure(Errors.apiError(error.localizedDescription)))
                    }
                } else {
                    completion(.failure(Errors.emptyResponse))
                }
            }
    }
}
