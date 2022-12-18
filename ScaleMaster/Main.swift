//
//  Main.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/17/22.
//

import SwiftUI


struct Main: View {
    
    @State private var scales: [scale]
    @State private var showingAlert = false
    
    
    init(scales: [scale]) {
        _scales = State(initialValue: scales)
    }
    
  @EnvironmentObject var storage: AppInfoStorage
    @State private var showingScale = false
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                //Put actual code here
                if scales.count > 0 {
                    Scale_View(scale: scales[0])
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
                        //var tempStore: [scale] = scales
                        //tempStore.insert(storage.previousScale!, at: 0)
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
                    showingScale.toggle()
                } label: {
                    
                        Text("Show Scale")
                        .font(.largeTitle)
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(.thinMaterial)
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                    
                }
            }
            if showingScale {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        //Show Fingerings
                    } label: {
                        
                        Text("Show Fingerings")
                            .font(.largeTitle)
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(.thinMaterial)
                            .clipShape(Rectangle())
                            .border(.black.opacity(0.5))
                        
                    }
                }
            }
            
            ToolbarItem(placement: .bottomBar) {
               Spacer()
            }
            
            ToolbarItem(placement: .bottomBar) {
                Button {
                    //Go to Next Scale
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

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Main(scales: AppInfoStorage.allScales)
                .environmentObject(AppInfoStorage())
        }
    }
}
