//
//  ContentView.swift
//  Note Lookup
//
//  Created by Carter Hawkins on 6/20/23.
//

import SwiftUI
import CoreHaptics

struct NoteLookup: View {
    
    @EnvironmentObject var storage: AppInfoStorage
    
    
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
    
    
    @State private var instrumentType: InstrumentType
    
    init(selectedInstrument: instrument) {
        
        var type: InstrumentType
        
        
        if selectedInstrument == .Tuba || selectedInstrument == .BaritoneBC {
            type = .fourvalve
        } else if selectedInstrument == .Trombone {
            type = .trigger
        } else {
            type = .standard
        }
        
        _instrumentType = State(initialValue: type)
    }
    
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
                            ScaleAndAccidentalSelector()
                            
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
                    
                    Menu {
                        Picker(storage.selectedInstrument.rawValue, selection: $storage.selectedInstrument) {
                            ForEach(AppInfoStorage.instrumentSelections, id: \.self)  { instrument in
                                Text(instrument.rawValue)
                            }
                        }
                        
                        
                    } label: {
                        Text(storage.selectedInstrument.rawValue)
                            .font(.title2)
                            .foregroundColor(.secondary)
                            .padding(15)
                            .background(.thinMaterial)
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                    }
                    
                    
                    
                    Menu {
                        Picker(instrumentType.rawValue, selection: $instrumentType) {
                            ForEach(InstrumentTypeChoices(selectedInstrument: storage.selectedInstrument), id: \.self)  { instrument in
                                Text(instrument.rawValue)
                            }
                        }
                        
                        
                    } label: {
                        Text(instrumentType.rawValue)
                            .font(.title2)
                            .foregroundColor(.secondary)
                            .padding(15)
                            
                            .background(.thinMaterial)
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                            .padding([.trailing, .leading])
                    }
                    
                    
                    
                    
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
            .onChange(of: storage.selectedInstrument) { selectedInstrument in
                var type: InstrumentType
                
                
                if selectedInstrument == .Tuba || selectedInstrument == .BaritoneBC {
                    type = .fourvalve
                } else if selectedInstrument == .Trombone {
                    type = .trigger
                } else {
                    type = .standard
                }
                
                instrumentType = type
            }
        }
    }
}

struct NoteLookup_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NoteLookup(selectedInstrument: .Tuba)
                .environmentObject(AppInfoStorage())
        }
    }
}