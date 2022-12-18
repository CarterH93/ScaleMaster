//
//  Main.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/17/22.
//

import SwiftUI
import AVFoundation

struct Main: View {
    
    @State private var scales: [scale]
    @State private var showingAlert = false
    @State private var showingScaleImage = false
    @State private var showingFingeringsImage = false
    
    @State private var scaleAudio: AVAudioPlayer?
    
    init(scales: [scale]) {
        _scales = State(initialValue: scales)
    }
    
  @EnvironmentObject var storage: AppInfoStorage
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.white, .white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    //Put actual code here
                    if scales.count > 0 {
                        Scale_View(scale: scales[0], geoH: geo.size.height, geoW: geo.size.width)
                    }
                    
                    
                    if showingFingeringsImage {
                        //show fingerings image
                        Image("\(scales[0].name)\(scales[0].octaves)\(storage.selectedInstrument)Fingerings")
                            .resizable()
                            .scaledToFit()
                    } else if showingScaleImage {
                        //show scale image
                        Image("\(scales[0].name)\(scales[0].octaves)\(storage.selectedInstrument)")
                            .resizable()
                            .scaledToFit()
                    }
                    
                }
                
            }
            .alert("You Have Played Through All the Scales", isPresented: $showingAlert) {
                Button("Home") {
                    storage.presentedViews.removeLast(storage.presentedViews.count)
                    
                }
            }
            .toolbar {
                if storage.previousScale != nil {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            //Put code for going to previous scale
                            resetButtons()
                            scales.insert(storage.previousScale!, at: 0)
                            storage.previousScale = nil
                        } label: {
                            
                            Text("Previous Scale")
                                .font(.largeTitle)
                                .foregroundColor(.secondary)
                                .padding(8)
                                .background(.thinMaterial)
                                .clipShape(Rectangle())
                                .border(.black.opacity(0.5))
                            
                        }
                        
                    }
                }
                
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        resetButtons()
                        storage.presentedViews.removeLast(storage.presentedViews.count)
                    } label: {
                        
                        Text("Home 🏠")
                            .font(.largeTitle)
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(.thinMaterial)
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                        
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        //Show Scale
                        showingScaleImage.toggle()
                        if !showingScaleImage {
                            showingFingeringsImage = false
                        }
                    } label: {
                        
                        Text("Show Scale")
                            .font(.title3)
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(.thinMaterial)
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                        
                    }
                }
                if showingScaleImage {
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            //Show Fingerings
                            showingFingeringsImage.toggle()
                        } label: {
                            
                            Text("Show Fingerings")
                                .font(.title3)
                                .foregroundColor(.secondary)
                                .padding(8)
                                .background(.thinMaterial)
                                .clipShape(Rectangle())
                                .border(.black.opacity(0.5))
                            
                        }
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        //Play Audio
                        do {
                            let path = Bundle.main.path(forResource: "\(scales[0].name)\(scales[0].octaves)\(storage.selectedInstrument)Audio", ofType: "m4a")
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
                            .font(.title3)
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(.thinMaterial)
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                        
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Spacer()
                }
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            //Go to Next Scale
                            resetButtons()
                            if scales.count > 1 {
                                storage.previousScale = scales[0]
                                scales.remove(at: 0)
                            } else {
                                showingAlert = true
                                storage.previousScale = nil
                            }
                            
                        } label: {
                            
                            Text("Next Scale")
                                .font(.largeTitle)
                                .foregroundColor(.accentColor)
                                .padding(10)
                                .background(.green)
                                .clipShape(Rectangle())
                                .border(.black.opacity(0.5))
                            
                        }
                    }
                    
                }
                .navigationTitle("Play This Scale!")
                .navigationBarTitleDisplayMode(.large)
                .navigationBarBackButtonHidden(true)
            }
        }
    
    func resetButtons() {
        showingScaleImage = false
        showingFingeringsImage = false
        scaleAudio?.stop()
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
    NavigationStack {
            Main(scales: AppInfoStorage.allScales)
                .environmentObject(AppInfoStorage())
        }
    }
}
