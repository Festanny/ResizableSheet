import SwiftUI
import ResizableSheet

struct ScrollableTwoSheet: View {
    @State var state2: ResizableSheetState = .hidden

    var body: some View {
        Button("Show sheet Two") {
            state2 = .medium
        }
        .resizableSheet($state2) { builder in
            builder.content { context in
                ResizableScrollView(
                    context: context,
                    main: {
                        GrabBar().opacity(0)
                        ForEach(0..<4) { index in
                            Text("line: \(index)")
                                .padding()
                        }
                    },
                    additional: {
                        ForEach(4..<25) { index in
                            Text("line: \(index)")
                                .padding()
                        }
                    }
                )
                    .overlay(
                        VStack {
                            GrabBar()
                            Spacer()
                        }
                    )
            }
        }
    }
}

struct ScrollableTwoSheet_Previews: PreviewProvider {
    static var previews: some View {
        ResizableSheetPreview {
            ScrollableTwoSheet()
        }
    }
}
