//
//  InstrumentChooser.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/17/22.
//

import SwiftUI

struct InstrumentChooser: View {
    @EnvironmentObject var storage: AppInfoStorage
    var body: some View {
        HStack {
            ScrollView(.horizontal) {
                HStack(spacing: 30) {
                    ForEach(AppInfoStorage.instrumentSelections, id: \.self) { instrument in
                        ZStack {
                            RoundedRectangle(cornerRadius: 50)
                                .foregroundColor(storage.selectedInstrument.rawValue == instrument.rawValue ? .green : .blue)
                                .aspectRatio(1.0, contentMode: .fit)
                            VStack {
                                Image(instrument.rawValue)
                                    .resizable()
                                    .scaledToFit()
                                Text(instrument.rawValue)
                                    .foregroundColor(.white)
                                    
                            }
                            .padding()
                            
                        }
                        .onTapGesture {
                            storage.selectedInstrument = instrument
                        }
                        .accessibilityAddTraits(.isButton)
                        
                        
                        
                    }
                }
            }
        }
    }
}

struct InstrumentChooser_Previews: PreviewProvider {
    static var previews: some View {
        InstrumentChooser()
            .environmentObject(AppInfoStorage())
    }
}
