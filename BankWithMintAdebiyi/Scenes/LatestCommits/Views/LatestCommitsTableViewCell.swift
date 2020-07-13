//
//  LatestCommitsTableViewCell.swift
//  BankWithMintAdebiyi
//
//  Created by Mojisola Adebiyi on 12/07/2020.
//  Copyright © 2020 Mojisola Adebiyi. All rights reserved.
//

import UIKit

class LatestCommitsTableViewCell: UITableViewCell {
    @IBOutlet private weak var cellImage: UIImageView!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    
    func configureCell(with data: GithubCommitResponse) {
        authorLabel.text = data.commit?.author?.name
        timeLabel.text = DateFormatterHelper.timeAgoFormat(date: DateFormatterHelper.stringToDate(date: data.commit?.author?.date ?? ""))
        cellImage.loadImageAsync(from: URL(string: data.committer?.avatar_url ?? ""))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImage.layer.cornerRadius = 25
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImage.image = UIImage.init(systemName: "person.circle")
    }
}
