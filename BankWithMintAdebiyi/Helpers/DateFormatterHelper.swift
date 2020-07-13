//
//  DateFormatterHelper.swift
//  BankWithMintAdebiyi
//
//  Created by Mojisola Adebiyi on 13/07/2020.
//  Copyright © 2020 Mojisola Adebiyi. All rights reserved.
//

import Foundation

struct DateFormatterHelper {
    static func stringToDate(date:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        print("\(date) \(dateFormatter.date(from: date))")
        return dateFormatter.date(from: date) ?? Date()
        
    }
    
    static func timeAgoFormat(date:Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}
