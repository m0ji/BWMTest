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
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
}

extension LatestCommitsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! LatestCommitsTableViewCell
        return cell
    }
    
    
}

extension LatestCommitsViewController: UITableViewDelegate {
    
}

