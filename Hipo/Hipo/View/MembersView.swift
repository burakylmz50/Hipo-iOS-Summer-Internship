//
//  MembersView.swift
//  snapkitTest
//
//  Created by Burak Yılmaz on 16.03.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import Foundation

class MembersView{
    var array = [HipoJson]()
    func loadJson(filename fileName: String)-> [HipoJson] {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(HipoJson.self, from: data)
                array.append(jsonData)
            } catch {
                print("error:\(error)")
            }
        }
        return array
    }
    
}
