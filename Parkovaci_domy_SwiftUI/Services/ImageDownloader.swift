//
//  ImageDownloader.swift
//  Parkovaci_domy_SwiftUI
//
//  Created by Jan Menšík on 03/04/2020.
//  Copyright © 2020 Jan Menšík. All rights reserved.
//

import Foundation
import Combine
import SwiftUI


class ImageDownloader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    
    var data: Data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(urlString: String) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            DispatchQueue.main.async { [weak self] in
                self?.data = data
            }
        }.resume()
        
    }
}
