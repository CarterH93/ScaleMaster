//
//  Storage.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/17/22.
//



import SwiftUI

//Edit this to expand App
//Adding instruments here will update the rest of the app
public enum instrument: String, Codable, CaseIterable {
    case Tuba
    case BaritoneBC = "Baritone B.C."
    case BassTrombone = "Bass Trombone"
}

func getSafeImage(named: String) -> Image {
   let uiImage =  (UIImage(named: named) ?? UIImage(named: "No Scale Image Available.png"))!
   return Image(uiImage: uiImage)
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

let savePath = getDocumentsDirectory().appendingPathComponent("SavedData")
let savePathForInstrument = getDocumentsDirectory().appendingPathComponent("SavedInstrument")
let savePathForUsingSlowedAudio = getDocumentsDirectory().appendingPathComponent("SlowedAudio")

class AppInfoStorage: ObservableObject {
    
    
    var listOfScalesToPlay: [scale] {
        var tempStore = self.selectedScales
        tempStore.shuffle()
        return tempStore
    }
    @Published var previousScale: scale? = nil
    
    @Published var linkedSpeedIsFast: Bool = false
    
    @Published var presentedViews: NavigationPath = NavigationPath()
    
    @Published var useSlowedAudio: Bool = false {
        //did set for saving data to the disk
        
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(useSlowedAudio) {
                
                let str = encoded
                let url = savePathForUsingSlowedAudio
                
                do {
                    try str.write(to: url, options: .atomicWrite)
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    static var allScaleNames: [String] {
        var tempStore = Set<String>()
        for scale in allScales {
            tempStore.insert(scale.name)
        }
        
        
        return Array(tempStore).sorted(by: {$0 < $1} )
    }
    
    //Edit this to expand App
    //You can make the id any number you want, it dosent matter. Just make sure no two numbers are the same.
    //Adding scales to this list will update the rest of the app.
    static let allScales: [scale] = [
    scale(id: 1, name: "C Major", octaves: 2),
    scale(id: 2, name: "F Major", octaves: 2),
    scale(id: 3, name: "Bb Major", octaves: 2),
    scale(id: 4, name: "Eb Major", octaves: 1),
    scale(id: 5, name: "Ab Major", octaves: 2),
    scale(id: 6, name: "Db Major", octaves: 1),
    scale(id: 7, name: "F# Major", octaves: 2),
    scale(id: 8, name: "B Major", octaves: 2),
    scale(id: 9, name: "E Major", octaves: 2),
    scale(id: 10, name: "A Major", octaves: 2),
    scale(id: 11, name: "D Major", octaves: 1),
    scale(id: 12, name: "G Major", octaves: 2),
    scale(id: 13, name: "Chromatic", octaves: 0),
    scale(id: 14, name: "Eb Major", octaves: 2),
    scale(id: 15, name: "Db Major", octaves: 2),
    scale(id: 16, name: "D Major", octaves: 2)
    ]
    
    static func OctaveChoices(inputScale: String, instrument: instrument) -> [Int]{
       var tempStore = Set<Int>()
       
       for scale in AppInfoStorage.allScales {
           if scale.name == inputScale {
               if scale.name == "Eb Major" || scale.name == "Db Major" || scale.name == "D Major" {
                   if instrument == .BassTrombone {
                       if scale.octaves < 2 {
                           //DO NOTHING

                       } else {
                           tempStore.insert(scale.octaves)
                       }
                   } else if scale.octaves > 1 {
                       //DO NOTHING
                       
                   } else {
                       tempStore.insert(scale.octaves)
                   }
               } else {
                   tempStore.insert(scale.octaves)
               }
               
               
           }
       }
       return Array(tempStore)
    }
    
    static let instrumentSelections: [instrument] = instrument.allCases
    @Published var selectedScales = [scale]() {
        //did set for saving data to the disk
        
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(selectedScales) {
                
                let str = encoded
                let url = savePath
                
                do {
                    try str.write(to: url, options: .atomicWrite)
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    
    
    @Published var selectedInstrument: instrument = .Tuba  {
        //did set for saving data to the disk
        
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(selectedInstrument) {
                
                let str = encoded
                let url = savePathForInstrument
                
                do {
                    try str.write(to: url, options: .atomicWrite)
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
        
        init() {
                if let savedItems = try? Data(contentsOf: savePath) {
                    if let decodedItems = try? JSONDecoder().decode([scale].self, from: savedItems) {
                        selectedScales = decodedItems
                    } else {
                        selectedScales = []
                    }
                }
            
            if let savedItems = try? Data(contentsOf: savePathForInstrument) {
                if let decodedItems = try? JSONDecoder().decode(instrument.self, from: savedItems) {
                    selectedInstrument = decodedItems
                } else {
                    selectedInstrument = .Tuba
                }
            }
            
            if let savedItems = try? Data(contentsOf: savePathForUsingSlowedAudio) {
                if let decodedItems = try? JSONDecoder().decode(Bool.self, from: savedItems) {
                    useSlowedAudio = decodedItems
                } else {
                    useSlowedAudio = false
                }
            }
                
             
            }
            
        
}


struct scale: Identifiable, Codable, Hashable {
    var id: Int
    var name: String
    var octaves: Int
    var isSelected = false
    
}
