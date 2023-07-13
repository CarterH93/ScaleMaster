//
//  PossibleNotes.swift
//  Scale Master
//
//  Created by Carter Hawkins on 7/12/23.
//

let PossibleNotes: [Notes] = [
   
    //Need to fill in!!!!!!!!
    
    //fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: <#T##Bool#>, valve2: <#T##Bool#>, valve3: <#T##Bool#>, valve4: <#T##Bool#>, slide: <#T##String#>),
    
    //Note
    Notes(position: 1, letter: .B, octave: 0, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .threevalve),
            fingering(instrument: .Tuba, instrumentType: .fourvalve)
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        //none
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            //none
        ]),
        
        
        
            
    ]),
    
    //Note
    Notes(position: 2, letter: .C, octave: 1, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
           //none
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: true, valve4: true),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: true, valve4: true),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 3, letter: .D, octave: 1, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: true, valve4: true),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: true),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: false, valve4: true),
        ]),
        
        
        
            
    ]),
    
    
]
