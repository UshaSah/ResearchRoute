//
//  ocr_wrapper.swift
//  ResearchRoute
//
//  Created by Rohan Malige on 3/20/24.
//
import SwiftUI
import UIKit
import VisionKit

struct DataScanner: UIViewControllerRepresentable {
    
    @Binding var startScanning: Bool
    @Binding var scanText: String
    
    func makeUIViewController(context: Context) -> DataScannerViewController {
        let controller = DataScannerViewController(
                            recognizedDataTypes: [.text()],
                            qualityLevel: .balanced,
                            isHighlightingEnabled: true
                        )
        
        controller.delegate = context.coordinator
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        
        if startScanning {
            try? uiViewController.startScanning()
        } else {
            uiViewController.stopScanning()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        var parent: DataScanner
        
        init(_ parent: DataScanner) {
            self.parent = parent
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            switch item {
            case .text(let text):
                parent.scanText = text.transcript
            default: break
            }
        }
        
    }
}
