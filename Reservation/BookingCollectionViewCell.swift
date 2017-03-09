//
//  BookingCollectionViewCell.swift
//  Reservation
//
//  Created by William Lundy on 3/8/17.
//  Copyright © 2017 William Lundy. All rights reserved.
//

import UIKit

class BookingCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var bookingDate: UILabel!
    @IBOutlet weak var bookingTime: UILabel!
    @IBOutlet weak var bookingService: UILabel!
    @IBOutlet weak var bookingPartySize: UILabel!
    @IBOutlet weak var bookingDuration: UILabel!
    
    @IBOutlet weak var bookingDescription: UITextView!
    
    
    @IBAction func rescheduleButton(_ sender: UIButton) {
    }
    @IBAction func cancelButton(_ sender: UIButton) {
    }
    
    
    
    
}
