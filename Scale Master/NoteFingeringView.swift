//
//  NoteFingeringView.swift
//  Scale Master
//
//  Created by Carter Hawkins on 7/12/23.
//

import SwiftUI


struct Valves: View {
    var fingering: fingering
    var body: some View {
        GeometryReader { geo in
            HStack {
                ZStack {
                    Circle()
                        .foregroundColor(fingering.valve1 == true ? Color("PressedValve") : Color("UnpressedValve"))
                    Circle()
                        .stroke(.black, lineWidth: 4)
                    Text("1")
                        .font(.system(size: geo.size.width * 0.1))
                }
                
                
                ZStack {
                    Circle()
                        .foregroundColor(fingering.valve2 == true ? Color("PressedValve") : Color("UnpressedValve"))
                    Circle()
                        .stroke(.black, lineWidth: 4)
                    Text("2")
                        .font(.system(size: geo.size.width * 0.1))
                }
                
                
                ZStack {
                    Circle()
                        .foregroundColor(fingering.valve3 == true ? Color("PressedValve") : Color("UnpressedValve"))
                    Circle()
                        .stroke(.black, lineWidth: 4)
                    Text("3")
                        .font(.system(size: geo.size.width * 0.1))
                }
                
                
                if fingering.instrumentType == .fourvalve {
                    ZStack {
                        Circle()
                            .foregroundColor(fingering.valve4 == true ? Color("PressedValve") : Color("UnpressedValve"))
                        Circle()
                            .stroke(.black, lineWidth: 4)
                        Text("4")
                            .font(.system(size: geo.size.width * 0.1))
                    }
                }
            }
            .padding()
            .frame(width: geo.size.width, height: geo.size.width)
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct Slides: View {
    
    var slide: String
    
    var body: some View {
        GeometryReader { geo in
            Text("Position: \(slide)")
                .font(.system(size: geo.size.width * 0.16))
                .frame(width: geo.size.width, height: geo.size.width)
                .frame(width: geo.size.width, height: geo.size.height)
        }
        
    }
}




struct NoteFingeringView: View {
    
    @EnvironmentObject var storage: AppInfoStorage
    
    var fingering: fingering
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color("UnpressedValve"))
            
            if fingering.instrumentType == .standard || fingering.instrumentType == .trigger {
                Slides(slide: fingering.slide)
                
            } else {
                Valves(fingering: fingering)
            }
        }
        
    }
}

struct NoteFingeringView_Previews: PreviewProvider {
    static var previews: some View {
        NoteFingeringView(fingering: fingering(instrumentType: .threevalve, valve1: true, valve3: true, valve4: true))
            .environmentObject(AppInfoStorage())
    }
}
