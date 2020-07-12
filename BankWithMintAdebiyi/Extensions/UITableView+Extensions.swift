//
//  UITableView+Extensions.swift
//  BankWithMintAdebiyi
//
//  Created by Mojisola Adebiyi on 12/07/2020.
//  Copyright © 2020 Mojisola Adebiyi. All rights reserved.
//

import Foundation

import UIKit

extension UITableView {
    
      func beginRefreshing() {
        //https://gist.github.com/mttcrsp/53a6fec3a5a16e020aa97926428057c9
        // Make sure that a refresh control to be shown was actually set on the view
        // controller and the it is not already animating. Otherwise there's nothing
        // to refresh.
        guard let refreshControl = refreshControl, !refreshControl.isRefreshing else {
          return
        }

        // Start the refresh animation
        refreshControl.beginRefreshing()

        // Make the refresh control send action to all targets as if a user executed
        // a pull to refresh manually
        refreshControl.sendActions(for: .valueChanged)

        // Apply some offset so that the refresh control can actually be seen
        let contentOffset = CGPoint(x: 0, y: -refreshControl.frame.height)
        setContentOffset(contentOffset, animated: true)
      }

      func endRefreshing() {
        refreshControl?.endRefreshing()
      }
}
