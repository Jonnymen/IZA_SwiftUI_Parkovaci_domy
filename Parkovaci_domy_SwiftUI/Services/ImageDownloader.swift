//
//  ImageDownloader.swift
//  Parkovaci_domy_SwiftUI
//
//  Created by Jan Menšík on 03/04/2020.
//  Copyright © 2020 Jan Menšík. All rights reserved.
//

// This file contains service for getting data of an image from URL

import Foundation
import Combine
import SwiftUI

// Observed class
class ImageDownloader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    
    var data: Data = Data() {
        didSet {
            // Send info that data was succesfully loaded
            didChange.send(data)
        }
    }
    // Initialize class instance with URL for image
    init(urlString: String) {
        
        // Transform url string to URL
        guard let url = URL(string: urlString) else { return }
        
        // Session datatask for downloading the data
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            // Asynchronously update data
            DispatchQueue.main.async { [weak self] in
                self?.data = data
            }
        }.resume()  // Every urlsession datatask needs to be resumed
        
    }
}
