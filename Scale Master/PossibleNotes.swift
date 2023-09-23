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
    
    
    //Note
    Notes(position: 4, letter: .E, octave: 1, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: false, valve4: true),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: true),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: true, valve3: true),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: true, valve3: true, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: true),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: true),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: true),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: true, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: true),
        ]),
        
        
        
            
    ]),
    
    
    
    //Note
    Notes(position: 5, letter: .F, octave: 1, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: true),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: true, valve3: true),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: true),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: true),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: true),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: true, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: true),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 6, letter: .G, octave: 1, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: true, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: false, valve4: false),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
        ]),
        
        
        
            
    ]),
    
    
    
    
    //Note
    Notes(position: 7, letter: .A, octave: 1, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 8, letter: .B, octave: 1, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: true),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: true, valve3: true),
        
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            
            //Same as normal C fingering
            
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: true),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: true),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: true, valve4: true),
        ]),
        
        
        
            
    ]),
    
    //Note
    Notes(position: 9, letter: .C, octave: 2, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        
        //Same as normal B fingering
        
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: true),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: true, valve3: true),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: true),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: true),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: true, valve4: true),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: true, valve4: true),
            
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 10, letter: .D, octave: 2, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: true, valve4: true),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: true, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: true),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: false, valve4: true),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 11, letter: .E, octave: 2, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: false, valve4: true),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: true, valve3: true, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: true),
        
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            
            //same as normal F fingering
            
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: true, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: true),
        ]),
        
        
        
            
    ]),
    
    //Note
    Notes(position: 12, letter: .F, octave: 2, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        
        //same as normal E fingering
        
        
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: true),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: true, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: true),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 13, letter: .G, octave: 2, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: true, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: false, valve4: false),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
        ]),
        
        
        
            
    ]),
    
    //Note
    Notes(position: 14, letter: .A, octave: 2, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 15, letter: .B, octave: 2, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: true, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: true, valve3: true, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: true),
    ]),
        
        //sharp
        
        //Same as normal C fingering
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: true, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: true),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 16, letter: .C, octave: 3, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        
        //same as normal B fingering
        
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: true, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: true),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: true, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: true),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 17, letter: .D, octave: 3, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: false, valve4: false),
        
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
        ]),
        
        
        
            
    ]),
    
    //Note
    Notes(position: 18, letter: .E, octave: 3, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            
            //Same as normal F fingering
            
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 19, letter: .F, octave: 3, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        
        //same as normal E fingering
        
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 20, letter: .G, octave: 3, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: true, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: false, valve4: false),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 21, letter: .A, octave: 3, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 22, letter: .B, octave: 3, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: false, valve4: false),
    ]),
        
        //sharp
        
        //Same as normal C fingering
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
        ]),
        
        
        
            
    ]),
    
    
    
    //Note
    Notes(position: 23, letter: .C, octave: 4, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        
        //same as normal B fingering
        
        
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: true, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: false, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 24, letter: .D, octave: 4, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 25, letter: .E, octave: 4, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
    ]),
        
        //sharp
        
        //same as normal F fingering
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 26, letter: .F, octave: 4, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        
        //same as normal E fingering
        
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 27, letter: .G, octave: 4, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: true, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: true, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: true, valve3: false, valve4: false),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
        ]),
        
        
        
            
    ]),
    
    //Note
    Notes(position: 28, letter: .A, octave: 4, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false),
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 29, letter: .B, octave: 4, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            fingering(instrument: .Tuba, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .Tuba, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false),
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
      
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            
            //same as normal C fingering
            
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 30, letter: .C, octave: 5, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        
        //same as normal B fingering
        
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
        
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
        
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
        ]),
        
        
        
            
    ]),
    
    //Note
    Notes(position: 31, letter: .D, octave: 5, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
            
            
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
      
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 32, letter: .E, octave: 5, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
      
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
        
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            
            //same as normal F fingering
            
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
            
        ]),
        
        
        
            
    ]),
    
    
    //Note
    Notes(position: 33, letter: .F, octave: 5, accidentalVariant: [
        //Accidentals (flat, natural, sharp)
                //flat
        
        //same as normal E fingering
        
        NoteAccidentalVariant(accidental: .flat, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            
            
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: true, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: true, valve3: false, valve4: false),
            
        ]),
           
            //natural
    NoteAccidentalVariant(accidental: .natural, fingeringVarient: [
        //Fingering per instrument and instrument type for accidental
      
        fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: false, valve2: false, valve3: false, valve4: false),
        fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: false, valve2: false, valve3: false, valve4: false),
        
        
    ]),
        
        //sharp
        
        NoteAccidentalVariant(accidental: .sharp, fingeringVarient: [
            //Fingering per instrument and instrument type for accidental
            
            fingering(instrument: .BaritoneBC, instrumentType: .threevalve, valve1: true, valve2: false, valve3: false, valve4: false),
            fingering(instrument: .BaritoneBC, instrumentType: .fourvalve, valve1: true, valve2: false, valve3: false, valve4: false),
            
        ]),
        
        
        
            
    ]),
    
]
