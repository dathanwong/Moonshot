//
//  Mission.swift
//  Moonshot
//
//  Created by Dathan Wong on 6/7/20.
//  Copyright © 2020 Dathan Wong. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable{
    struct Crew: Codable{
        let name: String
        let role: String
    }
    
    let id: Int
    let crew: [Crew]
    let description: String
    let launchDate: Date?
    
    var displayName: String{
        "Apollo \(id)"
    }
    var image: String{
        "apollo\(id)"
    }
    var formattedLaunchDate: String{
        if let launchDate = launchDate{
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        }else{
            return "N/A"
        }
    }
}


