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
        if scale.octaves == 2 {
            switch position {
                
            case 1:
                return 5.9
                
            case 2:
                return 5
            case 3:
                return 4.4
            case 4:
                return 4.0
            case 5:
                return 3.7
            case 6:
                return 3.4
            case 7:
                return 3.13
            case 8:
                return 2.8
            case 9:
                return 2.6
            case 10:
                return 2.45
            case 11:
                return 2.33
            case 12:
                return 2.2
            case 13:
                return 2.1
            case 14:
                return 2.02
            case 15:
                return 1.89
            case 16:
                return 1.78
            case 17:
                return 1.72
            case 18:
                return 1.65
            case 19:
                return 1.59
            case 20:
                return 1.54
            case 21:
                return 1.48
            case 22:
                return 1.41
            case 23:
                return 1.35
            case 24:
                return 1.31
            case 25:
                return 1.27
            case 26:
                return 1.23
            case 27:
                return 1.197
            case 28:
                return 1.17
            case 29:
                return 1.117
                
            default:
                return 9.2
            }
        } else if scale.octaves == 1 {
            
            switch position {
            case 1:
                return 8
            case 2:
                return 5.2
            case 3:
                return 4.35
            case 4:
                return 3.7
            case 5:
                return 3.2
            case 6:
                return 2.82
            case 7:
                return 2.52
            case 8:
                return 2.23
            case 9:
                return 1.93
            case 10:
                return 1.8
            case 11:
                return 1.67
            case 12:
                return 1.56
            case 13:
                return 1.47
            case 14:
                return 1.39
            case 15:
                return 1.285
            default:
                return 9.2
            }
            
        } else {
            return 10.1
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
                    .opacity(position > 0 ? 0.5 : 0)
                    
            }
        }
    }
}

struct ScaleWithMarking_Previews: PreviewProvider {
    static var previews: some View {
        ScaleWithMarking(scale: AppInfoStorage.allScales[12], showingFingeringsImage: true, position: 15)
            .environmentObject(AppInfoStorage())
    }
}
