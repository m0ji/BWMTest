//
//  NetworkManager.swift
//  BankWithMintAdebiyi
//
//  Created by Mojisola Adebiyi on 12/07/2020.
//  Copyright © 2020 Mojisola Adebiyi. All rights reserved.
//

import Foundation

enum RequestType: String {
    case get = "GET"
    case post = "POST"
}

class NetworkManager {
    private let config = URLSessionConfiguration.default
    private var session: URLSession?
    
    init() {
        session = URLSession.init(configuration: config)
        config.timeoutIntervalForRequest = 60
    }
    
    func makeRequest<T:Decodable>(requestType:RequestType, url:String, params: Dictionary<String,Any>?,   requestBody:Dictionary<String,Any>?, completionHandler: @escaping (Result<T?,Error>)-> ()){
        
        var urlComponent = URLComponents(string: url)
        
        if let params = params {
            var queryItems = [URLQueryItem]()
            for (key,value) in params {
                queryItems.append(URLQueryItem(name: key, value: "\(value)"))
            }
            urlComponent?.queryItems = queryItems
        }
                
        var request = URLRequest(url: urlComponent!.url!)
        request.httpMethod = requestType.rawValue
        
        
        if let requestBody = requestBody {
            if requestType == .get {
                completionHandler(.failure(CustomHttpError.NotJson))
            }
            
            let requestBodyData = try? JSONSerialization.data(withJSONObject: requestBody)
            request.httpBody = requestBodyData
        }

        print(request)
        
        let task = session!.dataTask(with: request) { (data, response, error) in
            
            //Handle Device related error
            if error != nil {
                completionHandler(.failure(error!))
                return
            }

            //Handle Server related error
            guard let httpResponse = response as? HTTPURLResponse else {return}
            print(response)
            if String(httpResponse.statusCode).first == "2" {
                print("HTTPResponse code \(httpResponse.statusCode)")
                if !(httpResponse.mimeType == "application/json"){
                    completionHandler(.failure(CustomHttpError.NotJson))
                    return
                }else {
                    do {
                        let json = try JSONDecoder().decode(T.self, from: data!)
                        completionHandler(.success(json))
                    } catch {
                        completionHandler(.failure(error))
                    }
                }
            } else if String(httpResponse.statusCode).first == "4" {
                completionHandler(.failure(CustomHttpError.BadRequest))
                
            } else if String(httpResponse.statusCode).first == "5" {
                completionHandler(.failure(CustomHttpError.ServerError))

            }  else {
                completionHandler(.failure(CustomHttpError.Unknown))
            }
        }
        
        task.resume()
    }
}
