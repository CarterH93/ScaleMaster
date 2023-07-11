//
//  ContentView.swift
//  Note Lookup
//
//  Created by Carter Hawkins on 6/20/23.
//

import SwiftUI
import CoreHaptics

struct NoteLookup: View {
    
    @Environment(\.scenePhase) private var scenePhase
    
    //core haptics
    @State private var engine: CHHapticEngine?
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func hapticFeedback() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.6)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern \(error.localizedDescription)")
        }
    }
    
    
    
    @State private var dragOffSet: CGSize = .zero
    @State private var position = 15
    @State private var currentDragIncrement = 0.0
    let stepby: Double = 10
    
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                //Main Stuff
                HStack {
                    Scale_ViewNoteLookup(location: position, accidental: .sharp, majorScale: listOfMajorScales.Eb)
                        .padding([.top], 100)
                        .gesture(DragGesture()
                            .onChanged({ (value) in
                                self.dragOffSet = value.translation
                                
                                if currentDragIncrement > 0 {
                                    if dragOffSet.height > currentDragIncrement + stepby {
                                        if position > 1 {
                                            position -= 1
                                            hapticFeedback()
                                        }
                                        currentDragIncrement += stepby
                                        
                                    } else {
                                        if dragOffSet.height < currentDragIncrement - stepby {
                                            if position < 33 {
                                                position += 1
                                                hapticFeedback()
                                            }
                                            currentDragIncrement -= stepby
                                            
                                        }
                                        
                                        
                                    }
                                } else {
                                    if dragOffSet.height < currentDragIncrement - stepby {
                                        if position < 33 {
                                            position += 1
                                            hapticFeedback()
                                        }
                                        currentDragIncrement -= stepby
                                        
                                    } else {
                                        
                                        if dragOffSet.height > currentDragIncrement + stepby {
                                            if position > 1 {
                                                position -= 1
                                                hapticFeedback()
                                            }
                                            currentDragIncrement += stepby
                                            
                                        }
                                        
                                        
                                    }
                                }
                                
                            })
                                 
                                .onEnded({ (value) in
                                    self.dragOffSet = .zero
                                    currentDragIncrement = 1.0
                                
                                })
                        )
                    VStack {
                        Rectangle()
                            .foregroundColor(.purple)
                        
                        HStack {
                            Rectangle()
                                .foregroundColor(.pink)
                            
                            Rectangle()
                                .foregroundColor(.blue)
                        }
                    }
                    .padding()
                }
                
                
                //Buttons
                HStack {
                    Image("up")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.1 ,height: geo.size.width / 13)
                        .padding(.leading)
                        .accessibilityAddTraits(.isButton)
                        .onTapGesture {
                            if position < 33 {
                                position += 1
                                hapticFeedback()
                            }
                        }
                    Image("down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.1 ,height: geo.size.width / 13)
                        .padding(.leading)
                        .accessibilityAddTraits(.isButton)
                        .onTapGesture {
                            if position > 1 {
                                position -= 1
                                hapticFeedback()
                            }
                        }
                    Spacer()
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.blue)
                        .frame(width: geo.size.width * 0.1 ,height: geo.size.width / 13)
                        .padding(.leading)
                        .accessibilityAddTraits(.isButton)
                        .onTapGesture {
                            //Add play code here
                        }
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: geo.size.width * 0.15 ,height: geo.size.width / 13)
                        .padding(.leading)
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: geo.size.width * 0.15 ,height: geo.size.width / 13)
                        .padding(.leading)
                        .padding(.trailing)
                }
                .padding(.bottom)
            }
            .onAppear(){
                        prepareHaptics()
                    }
                    .onChange(of: scenePhase) { phase in
                        switch phase {
                            case .active:
                                prepareHaptics()
                            default:
                                break
                        }
                    }
            .preferredColorScheme(.light)
        }
    }
}

struct NoteLookup_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NoteLookup()
        }
    }
}
