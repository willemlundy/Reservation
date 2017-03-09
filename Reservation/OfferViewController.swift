//
//  OfferViewController.swift
//  Reservation
//
//  Created by William Lundy on 3/7/17.
//  Copyright © 2017 William Lundy. All rights reserved.
//

import UIKit



class OfferViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var backgroundImageString = "reservation-keynote-images.001"
    
    // Page Observation Protocol
    weak var parentPageViewController: UIPageViewController!
    //weak var delegate: OfferViewControllerDelegate?
    
//    func getParentPageViewController(parentRef: UIPageViewController) {
//        parentPageViewController = parentRef
//    }
    
//    var firstTableViewItems: [BookingType] = ["Swedish Massage", "Deep Tissue Massage", "Hot Stone Massage", "Reflexology", "Trigger Point Massage"]
    
    var firstTableViewItems: [BookingType] = [.swedishMassage, .deepTissue, .hotStone, .reflexology, .triggerPoint]
    
    // MARK: UI Properties
    
    private let reserveButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 25, y: 275, width: 175, height: 40))
        button.backgroundColor = UIColor(r: 10, g: 84, b: 185, a: 1)
        button.layer.cornerRadius = 5
        button.setTitle("RESERVE", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let offerTableView: UITableView = {
        let offerTV = UITableView(frame: CGRect(x: 15, y: 378, width: 345, height: 266))
        offerTV.translatesAutoresizingMaskIntoConstraints = false
        offerTV.clipsToBounds = true
        offerTV.layer.cornerRadius = 10
        offerTV.alpha = 0.95
        return offerTV
    }()
    
    private let backgroundImageView: UIImageView = {
        let background = UIImageView(frame: UIScreen.main.bounds)
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    // MARK: ViewController State Transitions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.insertSubview(backgroundImageView, at: 0)
        view.addSubview(reserveButton)
        view.addSubview(offerTableView)
        
        setupOfferTableView()
        setupBackgroundImage()
        setupReserveButton()
    }
    
    // MARK: UI Set-up functions
    
    private func setupOfferTableView() {
        // Setup TableView
        offerTableView.dataSource = self
        offerTableView.delegate = self
        offerTableView.register(UITableViewCell.self, forCellReuseIdentifier: "offerCell")
        offerTableView.alwaysBounceVertical = false
        
        // Setup Constraints
        offerTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //offerTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: view.frame.height/4).isActive = true
        offerTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        offerTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        offerTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        offerTableView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 38).isActive = true
    }
    
    private func setupBackgroundImage() {
        // Setup Background Image
        backgroundImageView.image = UIImage(named: self.backgroundImageString)
        
        backgroundImageView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func setupReserveButton() {
        
        reserveButton.addTarget(self, action:#selector(self.reserveButtonClicked), for: .touchUpInside)
        
        reserveButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        reserveButton.widthAnchor.constraint(equalToConstant: 175).isActive = true
        reserveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        reserveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -38).isActive = true
    }
    
    func reserveButtonClicked() {
        if backgroundImageString == "HotStone.png"  {
            performSegue(withIdentifier: "ReservationSegue", sender: nil)
        }
    }
    
}

// MARK: TableView Methods

extension OfferViewController {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "offerCell", for: indexPath)
        
        cell.textLabel?.text = self.firstTableViewItems[indexPath.row].displayName()
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightThin)
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = .zero
        cell.layoutMargins = .zero
        cell.accessoryType = .disclosureIndicator
        cell.contentView.backgroundColor = .white
        
        if cell.textLabel?.text != BookingType.hotStone.displayName() {
            cell.selectionStyle = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstTableViewItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / CGFloat(self.firstTableViewItems.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            if let parentVC = parentPageViewController as? PageVC {
            parentPageViewController.setViewControllers([parentVC.pageControllArray[1]], direction: .forward, animated: true, completion: nil)
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
