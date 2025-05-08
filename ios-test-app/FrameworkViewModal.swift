//
//  FrameworkViewModal.swift
//  ios-test-app
//
//  Created by Appstick on 8/5/25.
//

import SwiftUI

final class FrameworkViewModal: ObservableObject {
    @Published var isShowFramerwork = false
    var selectedFramerWor: Framework? {
        didSet {
            isShowFramerwork = true
        }
    }
    
}
