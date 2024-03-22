import SwiftUI
import VisionKit

struct OcrView: View {
    @State private var startScanning = false
    @State private var scanText = ""
    
    var body: some View {
        VStack(spacing: 0) {
            if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
                DataScanner(startScanning: $startScanning, scanText: $scanText)
                    .frame(height: 400)
            } else {
                Text("Scanning not supported or unavailable.")
                    .foregroundColor(.secondary)
                    .padding()
            }

            Text(scanText)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(uiColor: .systemGray6))
            
            NavigationLink(destination: ProfessorView(), isActive: $startScanning) {
                EmptyView()
            }
        }
        .onChange(of: scanText) { newValue in
            if !newValue.isEmpty {
                startScanning = true // Use startScanning to trigger navigation
            }
        }
        .onAppear {
            startScanning = DataScannerViewController.isSupported && DataScannerViewController.isAvailable
        }
    }
}


