//
//  MembersModel.swift
//  snapkitTest
//
//  Created by Burak Yılmaz on 16.03.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import Foundation


struct HipoJson : Codable {
    let company : String!
    let team : String!
    var members : [Members]
    
    enum CodingKeys: String, CodingKey {
        
        case company = "company"
        case team = "team"
        case members = "members"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        company = try values.decodeIfPresent(String.self, forKey: .company)
        team = try values.decodeIfPresent(String.self, forKey: .team)
        members = try values.decodeIfPresent([Members].self, forKey: .members)!
    }
}

struct Members : Codable {
    var name : String!
    var age : Int!
    var location : String!
    var github : String!
    var hipo : Hipo
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case age = "age"
        case location = "location"
        case github = "github"
        case hipo = "hipo"
    }
}

struct Hipo : Codable {
    let position : String!
    let years_in_hipo : Int!
    
    enum CodingKeys: String, CodingKey {
        
        case position = "position"
        case years_in_hipo = "years_in_hipo"
    }
}
