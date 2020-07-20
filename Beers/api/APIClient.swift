//
//  APIClient.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

// ApiClient protocols
protocol ApiClientProtocol : class {
    func loadBeers(completion : @escaping(Result<BeerListResponse,Error>) -> ())
}

// ApiClient class to handle network requests
class ApiClient  : ApiClientProtocol{
    
    public init() {}
    
    // MARK: GenericRequest
    // *** Note *** can be modified to handle other type of request like Post, PUT and delete by adding request type and body..
    private func performRequest<T:Decodable>(url:String, decoder: JSONDecoder = JSONDecoder(), parameters : [String :Any]?  = nil ,completion:@escaping (Result<T,Error>)->Void)  {
        
        guard let url = URL(string: url) else {return}
        var request = URLRequest(url: url)
        if let _ = parameters {
            // add parameters if there are any
        }
        request.timeoutInterval = 60
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                // failure
                completion(.failure(error))
            }
            do {
                // reponse
                if let data = data {
                    let response = try decoder.decode(T.self, from: data)
                    completion(.success(response))
                }
                else {
                    completion(.failure(ApiError.invalidData))
                }
            }
            catch let jsonError {
                // json parse failure
                completion(.failure(jsonError))
            }
        }.resume()
    }
    
    
    // MARK: BeersListRequest
    func loadBeers(completion: @escaping (Result<BeerListResponse, Error>) -> ()) {
        performRequest(url: BeersApp.ApiURL.beersListURL) { result in
            completion(result)
        }
    }
    
}

// API errors.. which can be extended..
enum ApiError: Error {
    case invalidData
}
