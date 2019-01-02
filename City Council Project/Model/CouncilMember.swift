//
//  CouncilMember.swift
//  City Council Project
//
//  Created by Jabeen's MacBook on 12/24/18.
//  Copyright © 2018 Jabeen's MacBook. All rights reserved.
//

import Foundation

struct CouncilMember: Codable {
    struct Districts: Codable {
        let districts: [CouncilMember] // creating a type unwrappable, this could be called outerlayer
    }
    let id: String
    let districtNumber: Int
    let districtName: String
    let borough: String
    let neighborhoods: String
    let memberName: String
    let phone: String
    let email:String
    let twitter: String?
    let websiteAlt: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case districtNumber = "district-number"
        case districtName = "district-name"
        case borough
        case neighborhoods
        case memberName = "member-name"
        case phone
        case email
        case twitter
        case websiteAlt = "website-alt"
    }
    }

