//
//  PhotoModel.swift
//  Appcent_NASA_Case
//
//  Created by Zeliha Uslu on 15.04.2022.
//

import SwiftUI

struct PhotoModelResponse: Codable {
    
    var photos: [PhotoModel]
    
}

struct PhotoModel: Codable, Equatable {
    
    var id: Int
    var sol: Int
    var camera: CameraModel
    var img_src: String
    var earth_date: String
    var rover: RoverModel
    
    static func == (lhs: PhotoModel, rhs: PhotoModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}

struct CameraModel: Codable {
    
    var id: Int
    var name: String
    var rover_id: Int
    var full_name: String
    
}

struct RoverModel: Codable {
    
    var id: Int
    var name: String
    var landing_date: String
    var launch_date: String
    var status: String
    
}
