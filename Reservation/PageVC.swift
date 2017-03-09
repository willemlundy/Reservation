//
//  PageVC.swift
//  Reservation
//
//  Created by William Lundy on 3/7/17.
//  Copyright © 2017 William Lundy. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    private let mothersDayOffer = Offer(offerViewControllerName: "OfferItemVC",
                                backgroundImage: BookingType.mothersDay.offerBackgroundImage())
    private let hotStoneOffer = Offer(offerViewControllerName: "OfferItemVC",
                           backgroundImage: BookingType.hotStone.offerBackgroundImage())
    private let deepTissueOffer = Offer(offerViewControllerName: "OfferItemVC",
                              backgroundImage: BookingType.deepTissue.offerBackgroundImage())
    
    // Page View Controller Variables
    
    lazy var pageControllArray: [UIViewController] = {
        return [self.createVCFromOffer(offer: self.mothersDayOffer),
                self.createVCFromOffer(offer: self.hotStoneOffer),
                self.createVCFromOffer(offer: self.deepTissueOffer)]
        
    }()
    
    // Page View Controller Private Methods
    
    private func VCInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    private func createVCFromOffer(offer: Offer) -> OfferViewController {
        let offerViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: offer.offerViewControllerName) as! OfferViewController
        offerViewController.backgroundImageString = offer.backgroundImage
        offerViewController.parentPageViewController = self
        return offerViewController
    }
    
    // MARK: ViewControllr State Transitions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        if let firstVC = pageControllArray.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        self.navigationItem.title = "SPA SERVICE"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
                view.center = self.view.center
                view.center.y = view.center.y + 20
                view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                
                
            }
        }
    }
    
    // MARK: Page View Controller Methods
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewContIndex = pageControllArray.index(of: viewController) else { return nil }
        let prevIndex = viewContIndex - 1
        guard prevIndex >= 0 else { return pageControllArray.last }
        guard pageControllArray.count > prevIndex else { return nil }
        return pageControllArray[prevIndex]
        
    }
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewContIndex = pageControllArray.index(of: viewController) else { return nil }
        let nextIndex = viewContIndex + 1
        guard nextIndex < pageControllArray.count else { return pageControllArray.first }
        guard pageControllArray.count > nextIndex else { return nil }
        return pageControllArray[nextIndex]
        
    }
    
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageControllArray.count
    }
    
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = pageControllArray.index(of: firstViewController) else {
            return 0
        }
        
        return firstViewControllerIndex
    }
}


