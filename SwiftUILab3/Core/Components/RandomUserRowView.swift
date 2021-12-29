import SwiftUI

struct RandomUserRowView: View {
    var body: some View {
        HStack(spacing: 20) {
            ProfileImageView(imageStringURL: "https://randomuser.me/api/portraits/women/5.jpg")
                .frame(width: 60)
            Text("[Mr] Reishi, Joseph")
                .font(.title2)
                .bold()
        }
        .padding(.vertical, 5)
    }
}

struct RandomUserRowView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserRowView()
    }
}
