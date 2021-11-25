import SwiftUI

struct ContentView: View {
    @StateObject var vM = ContentViewModel()
    
    func fetchPost() {
        vM.fetch(postWithId: 1) { error in
            if let error = error {
                print(error)
                return
            }
            
            print("포스트 패치 성공: \(vM.post)")
        }
    }
    
    var body: some View {
        ScrollView {
            Text("title")
                .font(.title)
            Text("body")
                .font(.body)
            Divider()
            Button {
                fetchPost()
            } label: {
                Text("Fetch")
            }
        }
        .navigationTitle("Networking")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
