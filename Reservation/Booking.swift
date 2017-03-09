//
//  Booking.swift
//  Reservation
//
//  Created by William Lundy on 3/8/17.
//  Copyright © 2017 William Lundy. All rights reserved.
//

import Foundation

enum BookingType: String {
    case mothersDay
    case hotStone
    case deepTissue
    case swedishMassage
    case reflexology
    case triggerPoint
    

    func displayName() -> String {
        switch self {
        case .mothersDay:
            return "Mothers Day Massage"
        case .hotStone:
            return "Hot Stone Massage"
        case .deepTissue:
            return "Deep Tissue Massage"
        case .swedishMassage:
            return "Swedish Massage"
        case .reflexology:
            return "Reflexology"
        case .triggerPoint:
            return "Trigger Point Massage"
        }
    }
    
    func offerBackgroundImage() -> String {
        switch self {
        case .mothersDay:
            return "MothersDay.png"
        case .hotStone:
            return "HotStone.png"
        case .deepTissue:
            return "DeepTissue.png"
        case .swedishMassage:
            return "SwedishMassage.png"
        case .reflexology:
            return "Reflexology.png"
        case .triggerPoint:
            return "TriggerPoint.png"
        }
    }
    
    
}

struct Booking {
    
    var date: NSDate = NSDate(timeIntervalSince1970: 0)
    var service: String = "Default"
    var partySize: Int = 0
    var durration: Int = 0
    var description: String = "Default"

}
