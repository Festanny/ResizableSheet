import SwiftUI
import ResizableSheet

struct RootView: View {

    let windowScene: UIWindowScene?

    // 1. ResizableSheetCenter の作成
    var resizableSheetCenter: ResizableSheetCenter? {
        guard let windowScene = windowScene else {
            return nil
        }
        return ResizableSheetCenter.resolve(for: windowScene)
    }

    var body: some View {
        NavigationView {
            NavigationLink("Scrollable Sheet") {
                ScrollableSheet()
            }
        }
        // 2. ResizableSheetCenterを埋め込む
        .environment(\.resizableSheetCenter, resizableSheetCenter ?? PreviewResizableSheetCenter.shared)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        ResizableSheetPreview {
            RootView(windowScene: nil)
        }
    }
}
