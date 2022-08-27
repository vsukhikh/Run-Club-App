//
//  ProfileView.swift
//  Run Club App
//
//  Created by Vladimir Sukhikh on 2022-08-26.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedProfilePicker: ProfilePicker = .workouts
    
    //PhotoPicker
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @State private var ImagePickerEnabled = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack(alignment: .bottom) {
                    if selectedImage != nil {
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width: 158.0, height: 158.0)
                            
                    } else {
                        Circle()
                            .foregroundColor(.Gray02)
                            .frame(width: 158.0, height: 158.0)
                    }
                    Button(action: {
                        self.ImagePickerEnabled.toggle()
                    }) {
                        Image(systemName: "camera")
                            .foregroundColor(.Gray04)
                            .padding(.bottom, 20.0)
                    }
                }
                .sheet(isPresented: self.$isImagePickerDisplay) {
                                ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                            }
                .confirmationDialog("Choose source", isPresented: self.$ImagePickerEnabled) {
                    Button("Camera") {
                        self.sourceType = .camera
                        self.isImagePickerDisplay.toggle()
                    }
                    Button("Photo Library") {
                        self.sourceType = .photoLibrary
                        self.isImagePickerDisplay.toggle()
                    }
                }
                .padding()
                
                Text("Vladimir Sukhikh")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Picker("PtofilePicker", selection: $selectedProfilePicker) {
                    ForEach(ProfilePicker.allCases) { picker in
                        Text(picker.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                .padding([.leading, .bottom, .trailing])
                
                if (selectedProfilePicker == .workouts) {
                    WorkoutsView()
                } else {
                    ProfilePostsView()
                }
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Profile")
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
            .toolbar {
                Button(action: {print("Logout!")}) {
                    Text("Logout")
                        .fontWeight(.medium)
                        .foregroundColor(.GreenPrimary)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {print("Settings!")}) {
                        Text("Settings")
                            .fontWeight(.medium)
                            .foregroundColor(.GreenPrimary)
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
