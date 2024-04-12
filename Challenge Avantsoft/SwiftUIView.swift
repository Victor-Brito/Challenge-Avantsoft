import SwiftUI

struct TikTokSwipingBehavior: View {
    @State private var scrollOffset: CGFloat = 0
    @State private var previousScrollOffset: CGFloat = 0
    
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(0..<100) { i in
                        ZStack {
                            Rectangle()
                                .fill(Color.blue.opacity(0.6))
                                .containerRelativeFrame([.horizontal, .vertical])
                            Text("Video \(i+1)")
                                .font(.title)
                                .bold()
                            FeedView()
                        }
                        .id(i) // Identificador único para cada item na lista
                    }
                }
                .overlay(
                    GeometryReader { proxy in
                        Color.clear
                            .preference(key: ScrollOffsetKey.self, value: proxy.frame(in: .named("scroll")).minY)
                    }
                    .onPreferenceChange(ScrollOffsetKey.self) { value in
                        // Verificar se o scroll está indo para cima ou para baixo
                        if value > previousScrollOffset {
                            print("Scroll para baixo")
                        } else if value < previousScrollOffset {
                            print("Scroll para cima")
                        }
                        // Atualizar o valor do offset anterior
                        previousScrollOffset = value
                    }
                )
            }
            .coordinateSpace(name: "scroll")
        }
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
    }
}

// Chave de preferência para acompanhar o offset de scroll
struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}
