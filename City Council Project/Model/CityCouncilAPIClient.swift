//
//  CityCouncilAPIClient.swift
//  City Council Project
//
//  Created by Jabeen's MacBook on 12/24/18.
//  Copyright © 2018 Jabeen's MacBook. All rights reserved.
//

import Foundation

enum CounciMemberErrors {
    case badURL (String)
    case badData (Error)
    case badDecoding (Error)
}

final class CityCouncilAPIClient: Codable {
    static func getCouncilMembers (completionHandler: @escaping (([CouncilMember]?, CounciMemberErrors?) -> Void)) { // static because later we are going to call this function in our view controller
        // guard - unwrapping, we're sure this link works
        guard let url = URL.init(string: "http://callnyc.org/api/districts/") else { completionHandler (nil, .badURL("url failed"))
        return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {// if there is an error
                completionHandler(nil, .badData(error))
        }
            if let data = data {
                do {
                   let councilMemberData = try JSONDecoder().decode(CouncilMember.Districts.self, from: data)
                    completionHandler(councilMemberData.districts, nil)
                } catch {
                   completionHandler(nil, .badDecoding(error))
                }
            }
        }.resume()
    }
}
