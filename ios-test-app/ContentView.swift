//
//  ContentView.swift
//  ios-test-app
//
//  Created by Appstick on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    @StateObject var viewModal = FrameworkViewModal()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkCard(framerWork: framework).onTapGesture {
                            viewModal.selectedFramerWor = framework
                        }
                    }

                }
            }
            .navigationTitle("Menu")
            .sheet(isPresented: $viewModal.isShowFramerwork) {
                FrameworkDetails(
                    framerWork: viewModal.selectedFramerWor
                    ?? MockData.sampleFramework, isShowFramerwork: $viewModal.isShowFramerwork)
            }
        }
    }
}

#Preview {
    ContentView()
}

struct FrameworkCard: View {
    let framerWork: Framework

    var body: some View {
        VStack {
            Image(framerWork.urlString).resizable().frame(width: 64, height: 64)
            Text(framerWork.name).font(.title2).fontWeight(.semibold)
                .scaledToFit().minimumScaleFactor(0.6)
        }.padding()
    }
}

struct FrameworkDetails: View {
    let framerWork: Framework
    @Binding var isShowFramerwork: Bool
    @State private var isSafariView = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(
                    action: {
                        isShowFramerwork = false
                    },
                    label: {
                        Image(systemName: "xmark").foregroundStyle(
                            Color(.label)
                        ).imageScale(.large)
                    })
            }
            Spacer()
            Image(framerWork.urlString).resizable().frame(width: 64, height: 64)
            Spacer()
            Text(framerWork.name).font(.title2).fontWeight(.semibold)
                .scaledToFit().minimumScaleFactor(0.6)

            Text(framerWork.description).font(.title2)

            Spacer()
            Button("Learn More") {
                isSafariView = true
            }.font(.title2).fontWeight(.semibold).frame(width: 200, height: 40)
                .background(Color.red).foregroundColor(Color.white)
                .cornerRadius(8)
        }.padding().sheet(isPresented: $isSafariView) {
            SafariView(url: URL(string: "https://www.youtube.com/")!)
        }
    }
}
