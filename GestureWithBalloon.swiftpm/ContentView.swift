import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            PageView(story: storyInformation, pageIndex: 0)
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
