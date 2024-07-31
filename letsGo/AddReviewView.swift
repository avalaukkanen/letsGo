import SwiftUI

import SwiftUI

struct AddReviewView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ReviewViewModel
    @State private var title: String = ""
    @State private var content: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Review Details")) {
                    TextField("Title", text: $title)
                    TextField("Content", text: $content)
                }
            }
            .navigationTitle("new review")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.addReview(title: title, content: content)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct AddReviewView_Previews: PreviewProvider {
    static var previews: some View {
        AddReviewView(viewModel: ReviewViewModel())
    }
}
