//
//  ScaleViewerDetailView.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/19/22.
//

import SwiftUI
import AVFoundation




struct ScaleViewerDetailView: View {
    
    func getRealScale() -> scale? {
        for retrievedScale in AppInfoStorage.allScales {
            if retrievedScale.name == scale {
                if retrievedScale.octaves == octave {
                    return retrievedScale
                }
            }
        }
        return nil
    }
    
    @State private var showingFingeringsImage = false
    @State private var octave: Int
    
    @State private var scaleAudio: AVAudioPlayer?
    
   
    
    @EnvironmentObject var storage: AppInfoStorage
    
    var scale: String?
    
    
    init(scale: String?) {
        self.scale = scale
        
        _octave = State(initialValue: 0)
        
    }

    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.white, .white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                if let scale = scale {
                    
                    VStack {
                        VStack {
                            Text("\(scale) Scale")
                                .font(.system(size: geo.size.height > geo.size.width ? geo.size.height * 0.07: geo.size.height * 0.06))
                                .padding()
                                .background(.quaternary)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                            
                        }
                        .frame(alignment: .center)
                        .padding(20)
                        
                        if showingFingeringsImage {
                            getSafeImage(named: "\(scale)\(octave)\(storage.selectedInstrument)Fingerings")
                                .resizable()
                                .scaledToFit()
                        } else {
                            getSafeImage(named: "\(scale)\(octave)\(storage.selectedInstrument)")
                                .resizable()
                                .scaledToFit()
                        }
                        
                    }
                    
                    
                    
                } else {
                    Text("Please Select a Scale")
                }
            }
        }
        
        .onChange(of: scale) { newValue in
            scaleAudio?.stop()
            
            if let Wrappedscale = newValue {
                var tempStore: [Int] = AppInfoStorage.OctaveChoices(inputScale: Wrappedscale)
               tempStore = tempStore.sorted(by: { $0 < $1 })
                octave = tempStore[0]
            } else {
                
                octave = 0
            }
        }
        .onChange(of: storage.selectedInstrument) { _ in
            scaleAudio?.stop()
        }
        
        .toolbar {
            if let scale = scale {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        //Show Fingerings
                        showingFingeringsImage.toggle()
                        
                    } label: {
                        
                        Text("Show Fingerings")
                            .font(.title2)
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(.thinMaterial)
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                        
                        
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        //Play Audio
                        do {
                            var path = Bundle.main.path(forResource: "\(scale)\(octave)\(storage.selectedInstrument)Audio", ofType: "mp3")
                            
                            if storage.useSlowedAudio == true {
                                path = Bundle.main.path(forResource: "\(scale)\(octave)\(storage.selectedInstrument)AudioSlowed", ofType: "mp3")
                            }
                            
                            if let path = path {
                                let url = URL(fileURLWithPath: path)
                                scaleAudio = try AVAudioPlayer(contentsOf: url)
                                scaleAudio?.play()
                            } else {
                                
                            }
                        } catch {
                            // couldn't load file :(
                        }
                        
                    } label: {
                        
                        Text("Play Audio")
                            .font(.title2)
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(.thinMaterial)
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                        
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        if let tempscale = getRealScale() {
                            storage.linkedSpeedIsFast = false
                            storage.presentedViews.append(tempscale)
                            scaleAudio?.stop()
                        }
                        
                        
                    } label: {
                        
                        Text("Learn")
                            .font(.title2)
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(.blue.opacity(0.3))
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                        
                    }
                }
                ToolbarItem(placement: .bottomBar) { Spacer() }
                
                if octave > 0 {
                    ToolbarItem(placement: .bottomBar) {
                        
                        
                        Menu {
                            Picker("\(octave) \(octave == 1 ? "Octave" : "Octaves")", selection: $octave) {
                                ForEach(AppInfoStorage.OctaveChoices(inputScale: scale), id: \.self)  { octave in
                                    Text("\(octave) \(octave == 1 ? "Octave" : "Octaves")")
                                }
                            }
                            
                            
                        } label: {
                            Text("\(octave) \(octave == 1 ? "Octave" : "Octaves")")
                                .font(.title2)
                                .foregroundColor(.secondary)
                                .padding(8)
                                .background(.thinMaterial)
                                .clipShape(Rectangle())
                                .border(.black.opacity(0.5))
                        }
                        
        
                    }
                }
                
                
                ToolbarItem(placement: .bottomBar) {
                    
                    
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
                            .padding(8)
                            .background(.thinMaterial)
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                    }
                }
                
                
                
            }
        }
    }
}

struct ScaleViewerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ScaleViewerDetailView(scale: "A Major")
                .environmentObject(AppInfoStorage())
        }
       
    }
}
