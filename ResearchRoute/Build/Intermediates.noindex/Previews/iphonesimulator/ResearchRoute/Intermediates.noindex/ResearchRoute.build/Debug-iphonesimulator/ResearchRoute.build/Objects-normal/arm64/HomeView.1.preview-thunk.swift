@_private(sourceFile: "HomeView.swift") import ResearchRoute
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension HomeView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/rohan/Documents/WINTER 2024/ResearchRoute/ResearchRoute/ResearchRoute/ResearchRoute/View/HomeView.swift", line: 14)
        VStack {
            Text(__designTimeString("#712.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "Home"))
            
            Button(action: {
                userViewModel.logout()
            }, label: {
                Text(__designTimeString("#712.[1].[1].property.[0].[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "Logout"))
            })
            .padding()
        }
    
#sourceLocation()
    }
}

import struct ResearchRoute.HomeView
#Preview {
    HomeView()
}



