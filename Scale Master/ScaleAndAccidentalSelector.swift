//
//  ScaleAndAccidentalSelector.swift
//  Scale Master
//
//  Created by Carter Hawkins on 7/11/23.
//

import SwiftUI

struct ScaleAndAccidentalSelector: View {
    var body: some View {
        
        HStack {
            //Accidental Selector
            VStack(spacing: 5) {
                ZStack {
                    Rectangle()
                    Image("sharp")
                        .resizable()
                        .scaledToFit()
                }
                .accessibilityAddTraits(.isButton)
                .onTapGesture {
                    //Add code here
                }
                ZStack {
                    Rectangle()
                    Image("natural")
                        .resizable()
                        .scaledToFit()
                }
                .accessibilityAddTraits(.isButton)
                .onTapGesture {
                    //Add code here
                }
                ZStack {
                    Rectangle()
                    Image("flat")
                        .resizable()
                        .scaledToFit()
                }
                .accessibilityAddTraits(.isButton)
                .onTapGesture {
                    //Add code here
                }
            }
            //Major Scale Selector
            VStack {
                Rectangle()
                Rectangle()
            }
        }
        .foregroundColor(.gray)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

struct ScaleAndAccidentalSelector_Previews: PreviewProvider {
    static var previews: some View {
        ScaleAndAccidentalSelector()
    }
}
