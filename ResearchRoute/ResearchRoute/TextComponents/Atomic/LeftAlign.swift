//
//  LeftAlign.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/22/24.
//

import SwiftUI

struct LeftAlign<T: View>: View {
    let component: () -> T
    
    var body: some View {
        HStack {
            component()
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    LeftAlign {
        Text("Left Aligned")
    }
}
