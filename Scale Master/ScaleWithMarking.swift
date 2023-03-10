//
//  ScaleWithMarking.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/24/22.
//

import SwiftUI

struct ScaleWithMarking: View {
    
    @EnvironmentObject var storage: AppInfoStorage
    
    
    func getHeightFromWidth(_ width: Double) -> Double {
        return width / 5.61467889908
    }
    
    var getYPosition: Double {
        if scale.octaves == 0 {
            
            if position > 30 {
                return 0.3
            } else {
                return -0.3
            }
            
        } else {
            return 0.07
        }
    }
    
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
                return 2.87
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
            switch position {
                            
                        case 1:
                            return 6.6
                        case 2:
                            return 5.8
                        case 3:
                            return 5.0
                        case 4:
                            return 4.25
                        case 5:
                            return 3.85
                        case 6:
                            return 3.6
                        case 7:
                            return 3.3
                        case 8:
                            return 3.05
                        case 9:
                            return 2.87
            case 10:
                return 2.7
            case 11:
                return 2.55
            case 12:
                return 2.32
            case 13:
                return 2.2
            case 14:
                return 2.13
            case 15:
                return 2.03
            case 16:
                return 1.95
            case 17:
                return 1.88
            case 18:
                return 1.8
            case 19:
                return 1.74
            case 20:
                return 1.65
            case 21:
                return 1.6
            case 22:
                return 1.55
            case 23:
                return 1.5
            case 24:
                return 1.45
            case 25:
                return 1.41
            case 26:
                return 1.38
            case 27:
                return 1.33
            case 28:
                return 1.27
            case 29:
                return 1.24
            case 30:
                return 1.21
            case 31:
                return 5.2
            case 32:
                return 4.7
            case 33:
                return 4.3
            case 34:
                return 3.9
            case 35:
                return 3.6
            case 36:
                return 3.4
            case 37:
                return 3.1
            case 38:
                return 2.85
            case 39:
                return 2.7
            case 40:
                return 2.55
            case 41:
                return 2.43
            case 42:
                return 2.3
            case 43:
                return 2.2
            case 44:
                return 2.1
            case 45:
                return 2.0
            case 46:
                return 1.88
            case 47:
                return 1.8
            case 48:
                return 1.74
            case 49:
                return 1.67
            case 50:
                return 1.6
            case 51:
                return 1.56
            case 52:
                return 1.5
            case 53:
                return 1.45
            case 54:
                return 1.38
            case 55:
                return 1.35
            case 56:
                return 1.305
            case 57:
                return 1.27
            case 58:
                return 1.232
            case 59:
                return 1.195
                
                            
                        default:
                            return 9.4
                        }
        }
    }
    
    var scale: scale
    var showingFingeringsImage: Bool
    
    
    var position: Int
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                if showingFingeringsImage {
                    getSafeImage(named: "\(scale.name)\(scale.octaves)\(storage.selectedInstrument.rawValue)Fingerings")
                        .resizable()
                        .scaledToFit()
                    
                } else {
                    getSafeImage(named: "\(scale.name)\(scale.octaves)\(storage.selectedInstrument.rawValue)")
                        .resizable()
                        .scaledToFit()
                    
                }
                Rectangle()
                    .frame(width: geo.size.width / 40, height:  getHeightFromWidth(geo.size.width) * 0.7)
                    .position(x: geo.size.width / getPosition, y: geo.size.height / 2 +  getHeightFromWidth(geo.size.width) * getYPosition )
                    .foregroundColor(.red)
                    .opacity(position > 0 ? 0.5 : 0)
                    
            }
        }
    }
}

struct ScaleWithMarking_Previews: PreviewProvider {
    static var previews: some View {
        ScaleWithMarking(scale: AppInfoStorage.allScales[5], showingFingeringsImage: true, position: 2)
            .environmentObject(AppInfoStorage())
    }
}
