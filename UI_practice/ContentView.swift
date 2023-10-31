import SwiftUI

struct ContentView:View {
    private let message = "Hello Guys How are you"
    @State var animation_message = ""
    @State var index_value:Int = 0
    var colors:[Color] = [.red , .blue , .green , .purple , .pink , .white , .orange]
    @State var color = Color.red
    var body: some View {
        VStack{
            Text(animation_message)
                .foregroundStyle(color)
        }
        .onAppear{
            Typingeffect()
        }
         .onChange(of: animation_message, perform: { change in
             color = colors.randomElement()!
        })
    }
    private func Typingeffect(){
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: {
            timer in
            if (index_value < message.count){
                animation_message += String( message[message.index(message.startIndex, offsetBy: index_value)])
                index_value += 1
            }
            else{
                timer.invalidate()
            }
        })
    }
}


#Preview {
    ContentView()
}
