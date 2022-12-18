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
    
    
    
    @Published var presentedViews: NavigationPath = NavigationPath()
    
    static let allScales: [scale] = [
    scale(name: "C", octaves: 2),
    scale(name: "F", octaves: 2),
    scale(name: "Bb", octaves: 2),
    scale(name: "Eb", octaves: 1),
    scale(name: "Ab", octaves: 2),
    scale(name: "Db", octaves: 1),
    scale(name: "F#", octaves: 2),
    scale(name: "B", octaves: 2),
    scale(name: "E", octaves: 2),
    scale(name: "A", octaves: 2),
    scale(name: "D", octaves: 1),
    scale(name: "G", octaves: 2),
    scale(name: "chromatic", octaves: 0),
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
                        selectedScales = [scale(name: "Error", octaves: 1)]
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


struct scale: Identifiable, Codable {
    var id = UUID()
    var name: String
    var octaves: Int
    
}
