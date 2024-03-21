//
//  ocr.swift
//  ResearchRoute
//
//  Created by Rohan Malige on 3/20/24.
//
import SwiftUI
import VisionKit

struct OcrView: View {
    @State private var startScanning = false
    @State private var scanText = ""
    //    @State private var showSignInPage = false // To show the fallback option
    @State private var useDataScanner = false
    
    var body: some View {
        VStack(spacing: 0) {
            DataScanner(startScanning: $startScanning, scanText: $scanText)
                .frame(height: 400)
         
            Text(scanText)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                .background(in: Rectangle())
                .backgroundStyle(Color(uiColor: .systemGray6))
         
        }
        .task {
            if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
                startScanning.toggle()
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//VStack {
//    if useDataScanner {
//        DataScanner(startScanning: $startScanning, scanText: $scanText)
//            .frame(height: 400)
//
//        Text(scanText)
//            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
//            .background(in: Rectangle())
//            .backgroundStyle(Color(uiColor: .systemGray6))
//    } else {
//        // Fallback to manual image selection and OCR
//        Button("Select Image for OCR") {
//            showSignInPage = true
//        }
//        .sheet(isPresented: $showSignInPage) {
//            alt_ocr()
//        }
//    }
//}
//.task {
//    checkDataScannerSupport()
//    startScanning = useDataScanner
//}
//Button("Not working? Try it out manually!") {
//    showSignInPage = true
//}
//.sheet(isPresented: $showSignInPage) {
//    alt_ocr()
//}
//}
//
//@MainActor private func checkDataScannerSupport() {
//startScanning = DataScannerViewController.isSupported && DataScannerViewController.isAvailable
//}
//}
//
//struct ContentView_Previews: PreviewProvider {
//static var previews: some View {
//OcrView()
//}
//}
