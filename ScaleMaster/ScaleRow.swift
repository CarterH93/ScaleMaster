//
//  ScaleListSelector.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/17/22.
//

import SwiftUI

struct ScaleRow: View {
    
    @EnvironmentObject var storage: AppInfoStorage
    
    var scale: scale
    @Binding var selectedItems: Set<UUID>
    
    var isSelected: Bool {
        selectedItems.contains(scale.id)
    }
    
    var body: some View {
        HStack {
            Text(scale.name)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
            }
        }
        
        .contentShape(Rectangle())
        .padding()
        .onTapGesture {
            if isSelected {
                self.selectedItems.remove(scale.id)
                var count = 0
                for masterScale in storage.selectedScales {
                    
                    if masterScale.id == scale.id {
                        storage.selectedScales.remove(at: count)
                    }
                    count += 1
                }
            } else {
                self.selectedItems.insert(scale.id)
                storage.selectedScales.append(scale)
            }
        }
    }
}

struct ScaleRow_Previews: PreviewProvider {
    static var previews: some View {
        let id = UUID()
        ScaleRow(scale: scale(name: "testScale", octaves: 2), selectedItems: .constant([id]))
            .environmentObject(AppInfoStorage())
    }
}
