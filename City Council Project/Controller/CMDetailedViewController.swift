//
//  CMDetailedViewController.swift
//  City Council Project
//
//  Created by Jabeen's MacBook on 1/1/19.
//  Copyright © 2019 Jabeen's MacBook. All rights reserved.
//

import UIKit

class CMDetailedViewController: UIViewController {

    var councilMember: CouncilMember!
    
    @IBOutlet weak var memberNameLabel: UILabel!
    
    @IBOutlet weak var districtNumNameLabel: UILabel!
    
    @IBOutlet weak var boroughLabel: UILabel!
    
    @IBOutlet weak var neighborhoodLabel: UILabel!
    
    @IBOutlet weak var phoneButton: UIButton!
    
    @IBOutlet weak var emailButton: UIButton!
    
    @IBOutlet weak var twitterButton: UIButton!
    
    @IBOutlet weak var webisteButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        
    }
    
    func updateUI() {
        memberNameLabel.text = councilMember.memberName
        districtNumNameLabel.text = "\(councilMember.districtName)-\(councilMember.districtNumber)"
        boroughLabel.text = councilMember.borough
        neighborhoodLabel.text = councilMember.neighborhoods
    }

    

}
