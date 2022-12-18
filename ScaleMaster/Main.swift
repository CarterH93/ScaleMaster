//
//  Main.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/17/22.
//

import SwiftUI

struct Main: View {
    
  @EnvironmentObject var storage: AppInfoStorage
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
            .environmentObject(AppInfoStorage())
    }
}
