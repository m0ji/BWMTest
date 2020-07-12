//
//  GithubCommitResponseModel.swift
//  BankWithMintAdebiyi
//
//  Created by Mojisola Adebiyi on 12/07/2020.
//  Copyright © 2020 Mojisola Adebiyi. All rights reserved.
//

import Foundation

struct GithubCommitResponse: Codable {
    let sha : String?
    let node_id : String?
    let commit : Commit?
    let url : String?
    let html_url : String?
    let comments_url : String?
    let author : Author?
    let committer : Committer?
    let parents : [Parents]?
}

struct Commit : Codable {
    let author : Author?
    let committer : Committer?
    let message : String?
    let tree : Tree?
    let url : String?
    let comment_count : Int?
    let verification : Verification?
}

struct Verification : Codable {
    let verified : Bool?
    let reason : String?
    let signature : String?
    let payload : String?
}

struct Tree : Codable {
    let sha : String?
    let url : String?
}

struct Author : Codable {
    let login : String?
    let id : Int?
    let node_id : String?
    let avatar_url : String?
    let gravatar_id : String?
    let url : String?
    let html_url : String?
    let followers_url : String?
    let following_url : String?
    let gists_url : String?
    let starred_url : String?
    let subscriptions_url : String?
    let organizations_url : String?
    let repos_url : String?
    let events_url : String?
    let received_events_url : String?
    let type : String?
    let site_admin : Bool?
}

struct Committer : Codable {
    let login : String?
    let id : Int?
    let node_id : String?
    let avatar_url : String?
    let gravatar_id : String?
    let url : String?
    let html_url : String?
    let followers_url : String?
    let following_url : String?
    let gists_url : String?
    let starred_url : String?
    let subscriptions_url : String?
    let organizations_url : String?
    let repos_url : String?
    let events_url : String?
    let received_events_url : String?
    let type : String?
    let site_admin : Bool?
}

struct Parents : Codable {
    let sha : String?
    let url : String?
    let html_url : String?
}
