//
//  PhotosViewModel.swift
//  Appcent_NASA_Case
//
//  Created by Zeliha Uslu on 15.04.2022.
//

import Foundation
import Alamofire

class PhotosViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var errors: String? = nil
    @Published var photos: [PhotoModel] = []
    
    func getRoverPhotos(roverName: Rovers, page: Int, sol: Int, camera: String = "all") {
        AF.request(
            "https://api.nasa.gov/mars-photos/api/v1/rovers/\(roverName.rawValue)/photos?sol=\(sol)&page=\(page)\(camera == "all" ? "" : "&camera=\(camera)")&api_key=wtD626W0frwyiLlodYfvgn7cHHO2fCbMzymHKBrL",
                   method: .get)
        .responseDecodable(of: PhotoModelResponse.self) { response in
            if (response.error != nil) {
                self.errors = response.error?.errorDescription
                return
            }
            if (response.value != nil) {
                self.photos = response.value!.photos
                return
            }
        }
    }
    
}

enum Rovers: String {
    
    case spirit = "spirit"
    case opportunity = "opportunity"
    case curiosity = "curiosity"
    
}
