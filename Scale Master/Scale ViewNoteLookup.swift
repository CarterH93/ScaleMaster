//
//  Scale View.swift
//  Note Lookup
//
//  Created by Carter Hawkins on 6/20/23.
//

import SwiftUI

func getYPos(_ location: Int) -> Double {
    switch location {
    case 1:
        return 0.899
    case 2:
        return 0.868
    case 3:
        return 0.84
    case 4:
        return 0.813
    case 5:
        return 0.786
    case 6:
        return 0.757
    case 7:
        return 0.73
    case 8:
        return 0.7
    case 9:
        return 0.675
    case 10:
        return 0.646
    case 11:
        return 0.62
    case 12:
        return 0.59
    case 13:
        return 0.56
    case 14:
        return 0.533
    case 15:
        return 0.505
    case 16:
        return 0.475
    case 17:
        return 0.545
    case 18:
        return 0.52
    case 19:
        return 0.49
    case 20:
        return 0.465
    case 21:
        return 0.435
    case 22:
        return 0.41
    case 23:
        return 0.38
    case 24:
        return 0.354
    case 25:
        return 0.324
    case 26:
        return 0.299
    case 27:
        return 0.27
    case 28:
        return 0.243
    case 29:
        return 0.215
    case 30:
        return 0.186
    case 31:
        return 0.16
    case 32:
        return 0.13
    case 33:
        return 0.1
    default:
        return 0
    }
}

func getYPosForAccidental(_ location: Int) -> Double {
    if location < 17 {
       return (getYPos(location) + 0.045)
    } else {
        return (getYPos(location) - 0.045)
    }
}





struct Scale_ViewNoteLookup: View {
    
    var location: Int
    
    var accidental: Accidental
    
    var majorScale: MajorScaleRender
    
    var body: some View {
        GeometryReader { geo in
            //Note Scale View
            ZStack {
                Image("Music Scale")
                    .resizable()
                
                //Hiding extra ledgers
                
                //bottom
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.35)
                    .position(x: geo.size.width * 0.76, y: location < 13 ? geo.size.width * (getYPos(location) + 0.24) : geo.size.width * 0.8)
                
                //top
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.35)
                    .position(x: geo.size.width * 0.76, y: location > 21 ? geo.size.width * (getYPos(location) - 0.24) : geo.size.width * 0.2)
                    
                
                //Rendering Major Scale
                ZStack {
                    //Spot 1
                    if let spot = majorScale.spot1 {
                        Image(spot.accidental.rawValue)
                            .resizable()
                            .frame(width: geo.size.width * 0.06, height: (geo.size.width * 1.744107744) * 0.06)
                            .position(x: geo.size.width * 0.3, y: geo.size.width * spot.locationY)
                    }
                    
                    //Spot 2
                    if let spot = majorScale.spot2 {
                        Image(spot.accidental.rawValue)
                            .resizable()
                            .frame(width: geo.size.width * 0.06, height: (geo.size.width * 1.744107744) * 0.06)
                            .position(x: geo.size.width * 0.37, y: geo.size.width * spot.locationY)
                    }
                        
                    //Spot 3
                    if let spot = majorScale.spot3 {
                        Image(spot.accidental.rawValue)
                            .resizable()
                            .frame(width: geo.size.width * 0.06, height: (geo.size.width * 1.744107744) * 0.06)
                            .position(x: geo.size.width * 0.425, y: geo.size.width * spot.locationY)
                    }
                        
                    //Spot 4
                    if let spot = majorScale.spot4 {
                        Image(spot.accidental.rawValue)
                            .resizable()
                            .frame(width: geo.size.width * 0.06, height: (geo.size.width * 1.744107744) * 0.06)
                            .position(x: geo.size.width * 0.5, y: geo.size.width * spot.locationY)
                    }
                        
                    //Spot 5
                    if let spot = majorScale.spot5 {
                        Image(spot.accidental.rawValue)
                            .resizable()
                            .frame(width: geo.size.width * 0.06, height: (geo.size.width * 1.744107744) * 0.06)
                            .position(x: geo.size.width * 0.56, y: geo.size.width * spot.locationY)
                    }
                        
                    //Spot 6
                    if let spot = majorScale.spot6 {
                        Image(spot.accidental.rawValue)
                            .resizable()
                            .frame(width: geo.size.width * 0.06, height: (geo.size.width * 1.744107744) * 0.06)
                            .position(x: geo.size.width * 0.61, y: geo.size.width * spot.locationY)
                    }
                }
                
                //Rendering Music note and Accidental
                ZStack {
                    //Rendering Accidental
                    Image(accidental.rawValue)
                    .resizable()
                    .frame(width: geo.size.width * 0.04, height: (geo.size.width * 1.744107744) * 0.04)
                    .position(x: geo.size.width * 0.66, y: geo.size.width * getYPosForAccidental(location))
                    //Rendering Music Note
                    Image(location < 17 ? "NoteUp" : "NoteDown")
                        .resizable()
                        .frame(width: geo.size.width * 0.06, height: (geo.size.width * 2.408802686) * 0.06)
                        .position(x: geo.size.width * 0.76, y: geo.size.width * getYPos(location))
                }
            }
            .frame(width: geo.size.width, height: geo.size.width)
            .frame(width: geo.size.width, height: geo.size.height)
            
        }
       
       
        
    }
}

struct Scale_ViewNoteLookup_Previews: PreviewProvider {
    static var previews: some View {
        Scale_ViewNoteLookup(location: 15, accidental: .sharp, majorScale: listOfMajorScales.Db)
    }
}
