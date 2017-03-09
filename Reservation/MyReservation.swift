//
//  MyReservation.swift
//  Reservation
//
//  Created by William Lundy on 3/7/17.
//  Copyright © 2017 William Lundy. All rights reserved.
//

import UIKit
import IoniconsSwift


class MyReservation: UIViewController {
    
    var firstBooking = Booking()
    
    var bookingArray: [Booking] = []
    
    @IBOutlet weak var bookingCollectionView: UICollectionView!
    
    var backgroundImageString = "reservation-keynote-images.002.jpeg"
    
    let backgroundImageView: UIImageView = {
        let background = UIImageView(frame: UIScreen.main.bounds)
        //background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookingArray = [firstBooking, firstBooking, firstBooking]
    
        
        //view.insertSubview(backgroundImageView, at: 0)
        
        setupNavigationItem()
        //setupAlignmentBackgroundImage()

        

    }
    
    func setupNavigationItem() {
        self.navigationItem.title = "MY RESERVATION"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem?.image = Ionicons.plus.image(26)
    }
    
    func setupAlignmentBackgroundImage() {
        // Setup Background Image
        backgroundImageView.image = UIImage(named: "reservation-keynote-images.002.jpeg")
        
//        backgroundImageView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
//        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    
}

extension MyReservation: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookingArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingCell", for: indexPath) as! BookingCollectionViewCell
        let bookingItem = self.bookingArray[indexPath.row]
        cell.bookingDate.text = "  Tuesday"
        cell.bookingTime.text = "3:00PM"
        
        cell.bookingService.text = "Toe Smashing"
        cell.bookingPartySize.text = "Party Size - 3"
        cell.bookingDuration.text = "45M"
        cell.bookingDescription.text = "Get the upper hand with our chip-resistant, mirror-finish gel polish that requires no drying time and last up to two weeks."
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 20, height: 250)
    }
    
}

extension MyReservation: UICollectionViewDelegateFlowLayout {
    
    
    
}


extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}
