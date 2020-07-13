//
//  GithubService.swift
//  BankWithMintAdebiyi
//
//  Created by Mojisola Adebiyi on 12/07/2020.
//  Copyright © 2020 Mojisola Adebiyi. All rights reserved.
//

import Foundation

struct GithubService {
    private let networkManager = NetworkManager()
    
    func getLatestCommit(urlParameters: Dictionary<String, Any>?,  completionHandler: @escaping (Result<[GithubCommitResponse], Error>) -> ()) {
        let url = "https://api.github.com/repos/rails/rails/commits"
        networkManager.makeRequest(requestType: .get, url: url, params: urlParameters, requestBody: nil, completionHandler: completionHandler)
    }
}
