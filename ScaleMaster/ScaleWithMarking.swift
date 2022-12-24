//
//  ScaleWithMarking.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/24/22.
//

import SwiftUI

struct ScaleWithMarking: View {
    
    @EnvironmentObject var storage: AppInfoStorage
    
    var getPosition: Double {
       switch position {
           
       case 1:
           return 9.2
           
       default:
           return 13
       }
    }
    
    var scale: scale
    var showingFingeringsImage: Bool
    
    
    var position: Int
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                if showingFingeringsImage {
                    getSafeImage(named: "\(scale.name)\(scale.octaves)\(storage.selectedInstrument)Fingerings")
                        .resizable()
                        .scaledToFit()
                    
                } else {
                    getSafeImage(named: "\(scale.name)\(scale.octaves)\(storage.selectedInstrument)")
                        .resizable()
                        .scaledToFit()
                    
                }
                Rectangle()
                    .frame(width: geo.size.width / 40, height: geo.size.height > geo.size.width ? geo.size.width * 0.17: geo.size.height * 0.15)
                    .position(x: geo.size.width / getPosition, y: geo.size.height / 1.95)
                    .foregroundColor(.red)
                    .opacity(0.5)
            }
        }
    }
}

struct ScaleWithMarking_Previews: PreviewProvider {
    static var previews: some View {
        ScaleWithMarking(scale: AppInfoStorage.allScales[0], showingFingeringsImage: true, position: 1)
            .environmentObject(AppInfoStorage())
    }
}
