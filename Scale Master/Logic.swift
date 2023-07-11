//
//  Logic.swift
//  Note Lookup
//
//  Created by Carter Hawkins on 6/20/23.
//

import Foundation

enum Accidental: String {
    case natural, sharp, flat, none
}

enum InstrumentType: String, CaseIterable {
    case threevalve = "3 valve"
    case fourvalve = "4 valve"
    case standard = "standard"
    case trigger = "trigger"
}

func InstrumentTypeChoices(selectedInstrument: instrument) -> [InstrumentType] {
    if selectedInstrument == .Tuba || selectedInstrument == .BaritoneBC {
        return [.threevalve, .fourvalve]
    } else if selectedInstrument == .Trombone {
        return [.standard,.trigger]
    } else {
        return [.standard]
    }
}

enum MajorScale: String {
    case A, Ab, B, Bb, C, D, Db, E, Eb, F, FSharp, G
}

struct MajorScaleRender {
    let name: MajorScale
    let spot1: MajorScaleSpot?
    let spot2: MajorScaleSpot?
    let spot3: MajorScaleSpot?
    let spot4: MajorScaleSpot?
    let spot5: MajorScaleSpot?
    let spot6: MajorScaleSpot?
}

struct MajorScaleSpot {
    let locationY: Double
    let accidental: Accidental
}


struct listOfMajorScales {
    static let A = MajorScaleRender(name: .A, spot1: MajorScaleSpot(locationY: 0.44, accidental: .sharp), spot2: MajorScaleSpot(locationY: 0.526, accidental: .sharp), spot3: MajorScaleSpot(locationY: 0.408, accidental: .sharp), spot4: nil, spot5: nil, spot6: nil)
    static let Ab = MajorScaleRender(name: .Ab, spot1: MajorScaleSpot(locationY: 0.53, accidental: .flat), spot2: MajorScaleSpot(locationY: 0.45, accidental: .flat), spot3: MajorScaleSpot(locationY: 0.56, accidental: .flat), spot4: MajorScaleSpot(locationY: 0.425, accidental: .flat), spot5: nil, spot6: nil)
    static let C = MajorScaleRender(name: .C, spot1: nil, spot2: nil, spot3: nil, spot4: nil, spot5: nil, spot6: nil)
    static let F = MajorScaleRender(name: .F, spot1: MajorScaleSpot(locationY: 0.53, accidental: .flat), spot2: nil, spot3: nil, spot4: nil, spot5: nil, spot6: nil)
    static let Bb = MajorScaleRender(name: .Bb, spot1: MajorScaleSpot(locationY: 0.53, accidental: .flat), spot2: MajorScaleSpot(locationY: 0.45, accidental: .flat), spot3: nil, spot4: nil, spot5: nil, spot6: nil)
    static let Eb = MajorScaleRender(name: .Eb, spot1: MajorScaleSpot(locationY: 0.53, accidental: .flat), spot2: MajorScaleSpot(locationY: 0.45, accidental: .flat), spot3: MajorScaleSpot(locationY: 0.56, accidental: .flat), spot4: nil, spot5: nil, spot6: nil)
    static let Db = MajorScaleRender(name: .Db, spot1: MajorScaleSpot(locationY: 0.53, accidental: .flat), spot2: MajorScaleSpot(locationY: 0.45, accidental: .flat), spot3: MajorScaleSpot(locationY: 0.56, accidental: .flat), spot4: MajorScaleSpot(locationY: 0.48, accidental: .flat), spot5: MajorScaleSpot(locationY: 0.59, accidental: .flat), spot6: nil)
    static let B = MajorScaleRender(name: .B, spot1: MajorScaleSpot(locationY: 0.44, accidental: .sharp), spot2: MajorScaleSpot(locationY: 0.526, accidental: .sharp), spot3: MajorScaleSpot(locationY: 0.408, accidental: .sharp), spot4: MajorScaleSpot(locationY: 0.5, accidental: .sharp), spot5: MajorScaleSpot(locationY: 0.58, accidental: .sharp), spot6: nil)
    static let E = MajorScaleRender(name: .E, spot1: MajorScaleSpot(locationY: 0.44, accidental: .sharp), spot2: MajorScaleSpot(locationY: 0.526, accidental: .sharp), spot3: MajorScaleSpot(locationY: 0.408, accidental: .sharp), spot4: MajorScaleSpot(locationY: 0.5, accidental: .sharp), spot5: nil, spot6: nil)
    static let D = MajorScaleRender(name: .D, spot1: MajorScaleSpot(locationY: 0.44, accidental: .sharp), spot2: MajorScaleSpot(locationY: 0.526, accidental: .sharp), spot3: nil, spot4: nil, spot5: nil, spot6: nil)
    static let G = MajorScaleRender(name: .G, spot1: MajorScaleSpot(locationY: 0.44, accidental: .sharp), spot2: nil, spot3: nil, spot4: nil, spot5: nil, spot6: nil)
    static let FSharp = MajorScaleRender(name: .FSharp, spot1: MajorScaleSpot(locationY: 0.44, accidental: .sharp), spot2: MajorScaleSpot(locationY: 0.526, accidental: .sharp), spot3: MajorScaleSpot(locationY: 0.408, accidental: .sharp), spot4: MajorScaleSpot(locationY: 0.5, accidental: .sharp), spot5: MajorScaleSpot(locationY: 0.58, accidental: .sharp), spot6: MajorScaleSpot(locationY: 0.47, accidental: .sharp))
}
