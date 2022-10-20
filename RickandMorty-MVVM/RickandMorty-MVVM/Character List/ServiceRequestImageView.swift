//
//  ServiceRequestImageView.swift
//  RickandMorty-MVVM
//
//  Created by Matheus Oliveira on 10/19/22.
//

import UIKit

//Async image view
class ServiceRequestImageView: UIImageView {
    private let service = APIService()
    func fetch(using url: URL) {
        let request = URLRequest(url: url)
        service.perform(request) { [weak self] result in
            switch result {
            case .failure:
                print("Error fetching Image" )
            case .success(let imageData):
                guard let image = UIImage(data: imageData) else {return}
                DispatchQueue.main.async {
                    self?.contentMode = .scaleToFill
                    self?.image = image
                }
            }
        }
    }
}
