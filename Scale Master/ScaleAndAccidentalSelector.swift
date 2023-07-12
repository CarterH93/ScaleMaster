//
//  ScaleAndAccidentalSelector.swift
//  Scale Master
//
//  Created by Carter Hawkins on 7/11/23.
//

import SwiftUI

struct ScaleAndAccidentalSelector: View {
    @Binding var accidental: Accidental
    @Binding var selectedMajorScale: MajorScale
    
    var body: some View {
        GeometryReader { geo in
            HStack() {
                //Accidental Selector
                VStack(spacing: 5) {
                    ZStack {
                        Rectangle()
                        Image("sharp")
                            .resizable()
                            .scaledToFit()
                            .padding(8)
                    }
                    .accessibilityAddTraits(.isButton)
                    .onTapGesture {
                        accidental = .sharp
                    }
                    ZStack {
                        Rectangle()
                        Image("natural")
                            .resizable()
                            .scaledToFit()
                            .padding(8)
                    }
                    .accessibilityAddTraits(.isButton)
                    .onTapGesture {
                        accidental = .natural
                    }
                    ZStack {
                        Rectangle()
                        Image("flat")
                            .resizable()
                            .scaledToFit()
                            .padding(8)
                    }
                    .accessibilityAddTraits(.isButton)
                    .onTapGesture {
                        accidental = .flat
                    }
                }
                //Major Scale Selector
                
                
                Menu {
                    Picker(selectedMajorScale.rawValue, selection: $selectedMajorScale) {
                        ForEach(MajorScale.allCases, id: \.self)  { scale in
                            Text(scale.rawValue)
                        }
                    }
                    
                    
                } label: {
                    
                    
                    VStack {
                        Text("Major Scale")
                            .font(.system(size: geo.size.height * 0.17))
                            .foregroundColor(.black)
                        
                        
                        Text(selectedMajorScale.rawValue)
                            .font(.system(size: geo.size.height * 0.2))
                            .padding(5)
                            .foregroundColor(.secondary)
                        
                        
                            .background(.thinMaterial)
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                        
                        
                    }
                    
                    .frame(width: geo.size.width / 1.6, height: geo.size.height)
                    .background(.gray)
                    
                    
                }
                
                
            }
            .foregroundColor(.gray)
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
    }
}
/*
struct ScaleAndAccidentalSelector_Previews: PreviewProvider {
    static var previews: some View {
        ScaleAndAccidentalSelector(Accidental: .)
    }
}
*/
