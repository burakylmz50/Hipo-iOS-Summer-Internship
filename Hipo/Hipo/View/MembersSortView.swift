//
//  MembersSortView.swift
//  snapkitTest
//
//  Created by Burak Yılmaz on 17.03.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import Foundation

class MembersSortView{
    func sort(members:[HipoJson],character:String) -> [HipoJson]{
        var sortedArr = members
        
        sortedArr[0].members.sort(by: {
            
            let lastName1 = $0.name?.lastWord
            let lastName2 = $1.name?.lastWord
            
            if lastName1!.countNumberOfOccurrencesOfCharacter(char: character) != lastName2!.countNumberOfOccurrencesOfCharacter(char: character) {
                return lastName1!.countNumberOfOccurrencesOfCharacter(char: character) > lastName2!.countNumberOfOccurrencesOfCharacter(char: character)
            } else if lastName1!.count != lastName2!.count {
                return lastName1!.count > lastName2!.count
            } else {
                return lastName1! < lastName2!
            }
        })
        return sortedArr
    }
}
