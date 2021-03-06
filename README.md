# Keyboard Offset

## Installation

Add this Swift package in Xcode using its GitHub repository url. (File > Swift Packages > Add Package Dependency...)

## Usage

```swift 
import KeyboardOffset // 1. Import library

struct ContentView: View {
  
  @State private var firstName = ""
  @State private var lastName = ""
  @State private var street = ""
  @State private var city = ""
  
  var body: some View {
    NavigationView {
      Form {
        HStack {
          Spacer()
          Image(systemName: "cart.fill")
            .resizable()
            .aspectRatio(contentMode: ContentMode.fit)
            .frame(height: 200)
            .padding()
          Spacer()
        }
        
        
        Section {
          TextField("First Name", text: $firstName)
          TextField("Last Name", text: $lastName)
        }
        
        Section {
          TextField("Street", text: $street)
          TextField("City", text: $city)
        }
        
      }
      .navigationBarTitle(Text("Checkout"))
      .keyboardOffset() // 2. Add view modifier
    }
  }
}
```

## License

[MIT](./LICENSE)
