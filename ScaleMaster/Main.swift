//
//  Main.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/17/22.
//

import SwiftUI

struct Main: View {
    
  @EnvironmentObject var storage: AppInfoStorage
    @State private var showingScale = false
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                //Put actual code here
                
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    //Put code for going to previous scale
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
                    //Show Fingerings
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
            Main()
                .environmentObject(AppInfoStorage())
        }
    }
}
