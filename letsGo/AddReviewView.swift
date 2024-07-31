import SwiftUI

struct AddReviewView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ReviewViewModel
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var image: UIImage? = nil
    @State private var showingImagePicker = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Review Details")) {
                    TextField("Title", text: $title)
                    TextField("Content", text: $content)
                }
                Section {
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                    } else {
                        Button("Select Image") {
                            showingImagePicker = true
                        }
                    }
                }
            }
            .navigationTitle("New Review")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.addReview(title: title, content: content, image: image)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $image)
            }
        }
    }
}

struct AddReviewView_Previews: PreviewProvider {
    static var previews: some View {
        AddReviewView(viewModel: ReviewViewModel())
    }
}
