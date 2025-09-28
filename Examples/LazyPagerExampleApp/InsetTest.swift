import SwiftUI
import LazyPager


struct InsetTest: View {
    
    @State var data = [
        "nora1",
        "nora2",
        "nora3",
        "nora4",
        "nora5",
        "nora6",
    ]
    
    @State var show = false
    @State var ignoreSafeArea = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                if ignoreSafeArea {
                    LazyPager(data: data) { element in
                        Image(element)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .ignoresSafeArea()
                    
                    VStack {
                    }
                    .frame(width: 300, height: 300)
                    .background(.red)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                } else {
                    LazyPager(data: data) { element in
                        Image(element)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    
                    VStack {
                    }
                    .frame(width: 300, height: 300)
                    .background(.red)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                VStack {
                    Spacer()
                    Toggle("ignore safe area", isOn: $ignoreSafeArea)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    InsetTest()
}
