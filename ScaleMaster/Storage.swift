//
//  Storage.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/17/22.
//



import SwiftUI

public enum instrument: String, Codable {
    case Tuba, Test
}


func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

let savePath = getDocumentsDirectory().appendingPathComponent("SavedData")
let savePathForInstrument = getDocumentsDirectory().appendingPathComponent("SavedInstrument")

class AppInfoStorage: ObservableObject {
    
    var listOfScalesToPlay: [scale] {
        var tempStore = self.selectedScales
        tempStore.shuffle()
        return tempStore
    }
    @Published var previousScale: scale? = nil
    
    @Published var presentedViews = NavigationPath()
    
    
    static let allScaleNames: [String] = [
    "C Major",
    "F Major",
    "Bb Major",
    "Eb Major",
    "Ab Major",
    "Db Major",
    "F# Major",
    "B Major",
    "E Major",
    "A Major",
    "D Major",
    "G Major",
    "Chromatic"
    ]
    
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
    ]
    
    static let instrumentSelections: [instrument] = [.Tuba, .Test]
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
                
             
            }
            
        
}


struct scale: Identifiable, Codable, Hashable {
    var id: Int
    var name: String
    var octaves: Int
    var isSelected = false
    
}
