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
    
    
    
    @Published var presentedViews: [String] = []
    
    static let allScales: [scale] = [
    scale(id: 1, name: "C", octaves: 2),
    scale(id: 2, name: "F", octaves: 2),
    scale(id: 3, name: "Bb", octaves: 2),
    scale(id: 4, name: "Eb", octaves: 1),
    scale(id: 5, name: "Ab", octaves: 2),
    scale(id: 6, name: "Db", octaves: 1),
    scale(id: 7, name: "F#", octaves: 2),
    scale(id: 8, name: "B", octaves: 2),
    scale(id: 9, name: "E", octaves: 2),
    scale(id: 10, name: "A", octaves: 2),
    scale(id: 11, name: "D", octaves: 1),
    scale(id: 12, name: "G", octaves: 2),
    scale(id: 13, name: "chromatic", octaves: 0),
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


struct scale: Identifiable, Codable {
    var id: Int
    var name: String
    var octaves: Int
    var isSelected = false
    
}
