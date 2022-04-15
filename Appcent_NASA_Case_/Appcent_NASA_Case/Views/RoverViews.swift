//
//  SpiritView.swift
//  Appcent_NASA_Case
//
//  Created by Zeliha Uslu on 14.04.2022.
//

import SwiftUI

struct RoverView: View {

    let roverName: Rovers
    @State var currentCamera: String? = nil
    @State var currentPage: Int = 1
    @State var isLoading: Bool = false
    @State var currentSol: Int = 1
    @State var errors: String? = nil
    @State var photos: [PhotoModel] = []
    @StateObject var photosViewModel = PhotosViewModel()
    @State var presented: Bool = false
    @State var currentPhoto: PhotoModel = PhotoModel(id: 0, sol: 0, camera: CameraModel(id: 0, name: "", rover_id: 0, full_name: ""), img_src: "http://mars.nasa.gov/mer/gallery/all/2/n/1000/2N215136972EDNAS00P1585L0M1-BR.JPG", earth_date: "", rover: RoverModel(id: 0, name: "", landing_date: "", launch_date: "", status: ""))
    
    var body: some View {
        ZStack {
            Group {
                VStack {
                    ScrollView {
                        if self.errors != nil {
                            Text(self.errors!)
                        } else if self.photos.isEmpty {
                            ProgressView()
                                .scaleEffect(2)
                        } else if !self.photos.isEmpty {
                            LazyVStack(spacing: 20) {
                                Group {
                                    if self.isLoading {
                                        ProgressView()
                                            .scaleEffect(1.2)
                                    } else {
                                        ForEach(photos, id: \.id) { photo in
                                            RoverImage(image: URL(string: "https" + photo.img_src.dropFirst(4))!)
                                                .onTapGesture {
                                                    self.currentPhoto = photo
                                                    self.presented = true
                                                }
                                                .onAppear {
                                                    let index = photos.firstIndex(of: photo)
                                                    if (photos.count > 24 && (photos.count - 2) == index) {
                                                        self.currentPage += 1
                                                        photosViewModel.getRoverPhotos(roverName: self.roverName, page: self.currentPage, sol: self.currentSol)
                                                    }
                                                }
                                        }
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                            .onChange(of: currentCamera) { _ in
                                self.currentPage = 1
                                self.photos = []
                                photosViewModel.getRoverPhotos(roverName: self.roverName, page: self.currentPage, sol: self.currentSol, camera: currentCamera ?? "all")
                            }
                        }
                    }
                }
                .navigationTitle("\(self.roverName.rawValue) Photos")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            Button {
                                self.currentCamera = "FHAZ"
                            } label: {
                                Text("Filter by FHAZ")
                            }
                            
                            Button {
                                self.currentCamera = "RHAZ"
                            } label: {
                                Text("Filter by RHAZ")
                            }
                            Button {
                                self.currentCamera = "MAST"
                            } label: {
                                Text("Filter by MAST")
                            }
                            Button {
                                self.currentCamera = "CHEMCAM"
                            } label: {
                                Text("Filter by CHEMCAM")
                            }
                            Button {
                                self.currentCamera = "MAHLI"
                            } label: {
                                Text("Filter by MAHLI")
                            }
                            Button {
                                self.currentCamera = "MARDI"
                            } label: {
                                Text("Filter by MARDI")
                            }
                            Button {
                                self.currentCamera = "NAVCAM"
                            } label: {
                                Text("Filter by NAVCAM")
                            }
                            Button {
                                self.currentCamera = "all"
                            } label: {
                                Text("See all cameras")
                            }
                        } label: {
                            Image(systemName: "camera.fill")
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $presented) {
            self.presented = false
        } content: {
            PopupView(photo: self.$currentPhoto)
        }
        .onAppear {
            photosViewModel.getRoverPhotos(roverName: self.roverName, page: self.currentPage, sol: self.currentSol, camera: self.currentCamera ?? "all")
        }
        .onReceive(photosViewModel.$errors) { errors in
            self.errors = errors
        }
        .onReceive(photosViewModel.$photos) { photos in
            self.photos.append(contentsOf: photos)
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
