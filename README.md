# Hipo iOS Summer Internship
<img src="https://raw.githubusercontent.com/burakylmz50/Hipo-iOS-Summer-Internship/master/Images/screenShots.png" />

## Setup
* Close Xcode
* Open a terminal window, and $ cd into your project directory.
* Run $ pod install
* You may require to run $ pod update
* $ open Hipo.xcworkspace and build.

## Code structure

##### Add load json function
```swift
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
```
##### Sort members function
```swift
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
```

## Requirements
* iOS 11.0+
* Xcode 10.0+
* Swift 4.0+

## Author
If you wish to contact me, email at: byilmaz50@hotmail.com
