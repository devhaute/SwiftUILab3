import SwiftUI

struct RandomUserRowView: View {
    let user: RandomUser
    
    var body: some View {
        HStack(spacing: 20) {
            ProfileImageView(imageStringURL: user.picture.medium)
                .frame(width: 60)
            Text("[\(user.name.title)] \(user.name.first), \(user.name.last)")
                .font(.title2)
                .bold()
                .lineLimit(0)
        }
    }
}

struct RandomUserRowView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserRowView(user: RandomUser(id: "1", gender: "male", name: Name(title: "Mr", first: "آرسین", last: "مرادی"), picture: Picture(large: "https://randomuser.me/api/portraits/men/50.jpg", medium: "https://randomuser.me/api/portraits/med/men/50.jpg", thumbnail: "https://randomuser.me/api/portraits/thumb/men/50.jpg")))
            .previewLayout(.sizeThatFits)
    }
}
