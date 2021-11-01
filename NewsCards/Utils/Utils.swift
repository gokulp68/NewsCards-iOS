//
//  Utils.swift
//  NewsCards
//
//  Created by Personal on 24/10/21.
//

import Foundation
class Utils {
    // MARK: - Properties
    private static var sharedUtilsManager: Utils = {
        let utilsManager = Utils()
        return utilsManager
    }()
    // Initialization
    private init() {
    }
    // MARK: - Accessors
    class func shared() -> Utils {
        return sharedUtilsManager
    }
    
    //MARK:- Methods
    
    func formatTime(timeString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: timeString)!
        dateFormatter.dateFormat = "MMMM d, yyyy"
        return dateFormatter.string(from: date)
    }
    
    func getTodayDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "EEEE d MMMM"
        return dateFormatter.string(from: date)
    }
}
