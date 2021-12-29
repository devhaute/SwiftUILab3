import SwiftUI

struct ProfileImageView: View {
    let imageStringURL: String
    var imageURL: URL {
        URL(string: imageStringURL) ??
        URL(string: "https://randomuser.me/api/portraits/men/14.jpg")!
    }
    
    var body: some View {
        AsyncImage(url: imageURL) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(
                        Circle()
                    )
                    .padding(1)
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 2)
                            .fill(.yellow)
                    )
            } else if phase.error != nil {
                Text("Unable to load the image")
            } else {
                Text("Loading...")
            }
        }
    }
}
    
struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ProfileImageView(imageStringURL: "https://randomuser.me/api/portraits/men/14.jpg")
        }
        .previewLayout(.sizeThatFits)
    }
}
