//
//  Logic.swift
//  Note Lookup
//
//  Created by Carter Hawkins on 6/20/23.
//

import Foundation

func figureOutAudioPos(position: Int, accidental: Accidental, octave: Int, note: NoteLetters) -> Double {
    
    var startingPoint: Int = 0
    
    
    if position > 7 {
        //Adds previous notes
        startingPoint += 7 * 2
        
        
        //Take away 2 for B-C and E-F weird change
        startingPoint -= 2
        
    }
    
    
    if position > 14 {
        //Adds previous notes
        startingPoint += 7 * 2
        
        
        //Take away 2 for B-C and E-F weird change
        startingPoint -= 2
        
    }
   
    if position > 21 {
        //Adds previous notes
        startingPoint += 7 * 2
        
        
        //Take away 2 for B-C and E-F weird change
        startingPoint -= 2
        
    }
    
    
    if position > 28 {
        //Adds previous notes
        startingPoint += 7 * 2
        
        
        //Take away 2 for B-C and E-F weird change
        startingPoint -= 2
        
    }
    
    let noteOrder: [NoteLetters] = [.B, .C, .D, .E, .F, .G, .A]
    
    var notecount = 0
    for note1 in noteOrder {
        notecount += 1
        if note1 == note {
            startingPoint += notecount * 2
            
            if notecount > 1 {
                startingPoint -= 1
            }
            
            if notecount > 4 {
                startingPoint -= 1
            }
            
            
        }
        
        
        
    }
    
    startingPoint -= 1
   
   
    switch accidental {
    case .natural, .none:
        
        
        return (Double(startingPoint) * 1.5)
    case .sharp:
        
        
        return (Double(startingPoint) * 1.5) + 1.5
    case .flat:
        
        
        return (Double(startingPoint) * 1.5) - 1.5
    }
    
    
}

struct SingleNote {
    let position: Int
    let letter: NoteLetters
    let octave: Int
    let accidental: Accidental
    let fingering: fingering?
}

func convertLetterAccidentalToSymbol(_ accidental: Accidental) -> String {
    switch accidental {
    case .natural:
        return ""
    case .sharp:
        return "♯"
    case .flat:
        return "♭"
    case .none:
       return ""
    }
}

struct Notes {
    let position: Int
    let letter: NoteLetters
    let octave: Int
    let accidentalVariant: [NoteAccidentalVariant]
}

struct NoteAccidentalVariant {
    let accidental: Accidental
    let fingeringVarient: [fingering?]
}

func calculateNoteInfo(position: Int, instrument: instrument, type: InstrumentType, MajorScale: MajorScale, accidental: Accidental) -> SingleNote {

    
    
    
    for note in PossibleNotes {
        //Check to make sure we retrieve the right note information
        if note.position == position {
            //We now know the position matches
            
            for accidentalVar in note.accidentalVariant {
                if accidentalVar.accidental == calculateFinalAccidental(letter: note.letter, userInputedAccidental: accidental, majorScale: MajorScale) {
                    //We now know the accidental matches
                    
                    for fingeringvar in accidentalVar.fingeringVarient {
                        if let fingeringvar = fingeringvar {
                            if fingeringvar.instrument == instrument {
                                if fingeringvar.instrumentType == type {
                                    
                                    //We know now instrument and instrument type match
                                    
                                    //return fingerings
                                    
                                    return SingleNote(position: position, letter: note.letter, octave: note.octave, accidental: accidentalVar.accidental, fingering: fingeringvar)
                                    
                                }
                            }
                        }
                        
                    }
                    //return NO fingerings
                    return SingleNote(position: position, letter: note.letter, octave: note.octave, accidental: accidentalVar.accidental, fingering: nil)
                }
            }
            
           
            
            
        }
        
        
    }
    
    return SingleNote(position: 15, letter: NoteLetters.B, octave: 9, accidental: .sharp, fingering: fingering(instrument: instrument, instrumentType: type, valve3: true, valve4: false, slide: "error"))
    
    
}



func calculateFinalAccidental(letter: NoteLetters, userInputedAccidental: Accidental, majorScale: MajorScale) -> Accidental {
    var isNoteEffectedByMajorScale = false
    for note in findListOfMajorScalesAccidentalEffecting(majorScale).notes {
        if letter == note {
           isNoteEffectedByMajorScale = true
        }
    }
    
    if majorScale != .none {
        if isNoteEffectedByMajorScale == true {
            return findListOfMajorScalesAccidentalEffecting(majorScale).accidental
        } else {
            return .natural
        }
    } else {
        return userInputedAccidental
    }
}

func findListOfMajorScalesAccidentalEffecting(_ majorScale: MajorScale) -> (accidental: Accidental, notes: [NoteLetters]) {
    switch majorScale {
    case .A:
        return (.sharp, [.C, .F, .G])
    case .Ab:
        return (.flat, [.A, .B, .D, .E])
    case .B:
        return (.sharp, [.A, .C, .D, .F, .G])
    case .Bb:
        return (.flat, [.B, .E])
    case .C:
        return (.none, [])
    case .D:
        return(.sharp, [.C, .F])
    case .Db:
        return(.flat, [.G, .A, .B, .D, .E])
    case .E:
        return(.sharp, [.C, .D, .F, .G])
    case .Eb:
        return(.flat, [.A, .B, .E])
    case .F:
        return(.flat, [.B])
    case .FSharp:
        return(.sharp, [.A, .C, .D, .E, .F, .G])
    case .G:
        return(.sharp, [.F])
    case .none:
        return (.none, [])
    }
}




enum NoteLetters: String {
    case A, B, C, D, E, F, G
}


enum Accidental: String {
    case natural, sharp, flat, none
}

enum InstrumentType: String, CaseIterable {
    case threevalve = "3 valve"
    case fourvalve = "4 valve"
    case standard = "standard"
    case trigger = "trigger"
}

struct fingering {
    var instrument: instrument
    var instrumentType: InstrumentType
    var valve1: Bool = false
    var valve2: Bool = false
    var valve3: Bool = false
    var valve4: Bool = false
    var slide: String = "-1"
}

func convertMajorScaleToRender(_ majorScale: MajorScale) -> MajorScaleRender {
    switch majorScale {
    case .A:
        return listOfMajorScales.A
    case .Ab:
        return listOfMajorScales.Ab
    case .B:
        return listOfMajorScales.B
    case .Bb:
        return listOfMajorScales.Bb
    case .C:
        return listOfMajorScales.C
    case .D:
        return listOfMajorScales.D
    case .Db:
        return listOfMajorScales.Db
    case .E:
        return listOfMajorScales.E
    case .Eb:
        return listOfMajorScales.Eb
    case .F:
        return listOfMajorScales.F
    case .FSharp:
        return listOfMajorScales.FSharp
    case .G:
        return listOfMajorScales.G
    case .none:
        return listOfMajorScales.C
    }
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

enum MajorScale: String, CaseIterable {
    case A
    case Ab = "A♭"
    case B
    case Bb = "B♭"
    case C
    case D
    case Db = "D♭"
    case E
    case Eb = "E♭"
    case F
    case FSharp = "F♯"
    case G
    case none
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
