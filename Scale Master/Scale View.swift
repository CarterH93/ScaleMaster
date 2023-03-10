//
//  Scale View.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/18/22.
//

import SwiftUI

struct Scale_View: View {
    
    var scale: scale
    var geoH : Double
    var geoW: Double
    var body: some View {
            VStack {
                VStack {
                    Text("\(scale.name) Scale")
                        .font(.system(size: geoH > geoW ? geoH * 0.1: geoH * 0.2))
                        
                    
                    Text("\(scale.octaves == 1 ? "1 Octave" : scale.octaves == 0 ? "" : "\(scale.octaves) Octaves")")
                        .font(.system(size: geoH > geoW ? geoH * 0.03: geoH * 0.06))
                }
                .padding(15)
                .background(.quaternary)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            }
            .frame(alignment: .center)
    }
}

struct Scale_View_Previews: PreviewProvider {
    static var previews: some View {
        Scale_View(scale: scale(id: 999, name: "Test", octaves: 2), geoH: 1000, geoW: 1000)
    }
}
