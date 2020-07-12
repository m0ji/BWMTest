//
//  LatestCommitsViewController.swift
//  BankWithMintAdebiyi
//
//  Created by Mojisola Adebiyi on 12/07/2020.
//  Copyright © 2020 Mojisola Adebiyi. All rights reserved.
//

import UIKit

class LatestCommitsViewController: UIViewController {
    private let cellIdentifier = "\(LatestCommitsTableViewCell.self)"
    private let githubService = GithubService()
    private var commits = [GithubCommitResponse]()
    
    var refreshControl = UIRefreshControl()
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    private func setupViews() {
        navigationItem.title = "Latest Commits"
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        tableView.beginRefreshing()
    }
    
    @objc func didPullToRefresh() {
        githubService.getLatestCommit(urlParameters: nil){ [weak self] (response) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.endRefreshing()
                self.tableView.reloadData()
            }
            switch response {
            case .success(let success):
                self.commits = success
            case .failure(let failure):
                DispatchQueue.main.async {
                    self.tableView.showEmptyState(message: "\(failure.localizedDescription)\n\n Pull to refresh")
                }
                print(failure)
            }
        }
    }

}

extension LatestCommitsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if commits.count < 1 {
            tableView.showEmptyState(message: "No commits in this repo \n Pull to refresh")
        }else {
            tableView.hideEmptyState()
        }
        return commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let commit = commits[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! LatestCommitsTableViewCell
        cell.configureCell(with: commit)
        return cell
    }
}

extension LatestCommitsViewController: UITableViewDelegate {
    
}
