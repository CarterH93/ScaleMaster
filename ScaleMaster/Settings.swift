//
//  Settings.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/17/22.
//

import SwiftUI

struct Settings: View {
    
    @EnvironmentObject var storage: AppInfoStorage
    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("NiceOrange"), .white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Text("Choose Your Instrument")
                        .padding(.top)
                    InstrumentChooser()
                        .padding()
                        .font(.system(size: geo.size.height > geo.size.width ? geo.size.width * 0.03: geo.size.height * 0.04))
                }
                .background(.ultraThickMaterial)
                .frame(width: geo.size.width * 0.95, height: geo.size.height > geo.size.width ? geo.size.width * 0.40: geo.size.height * 0.50)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                
                
                
                
                
                
            }
            .navigationTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Settings()
                .environmentObject(AppInfoStorage())
        }
    }
}
