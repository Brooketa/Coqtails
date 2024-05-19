import SwiftUI

struct DetailsCategoriesView: View {
    
    let categoryType: String
    let glassType: String
    let alcoholicType: String
    
    var body: some View {
        HStack(spacing: 0) {
            CategoryView(imageName: "category", title: categoryType)
            
            CategoryView(imageName: "glass", title: glassType)
            
            CategoryView(imageName: "alcoholic", title: alcoholicType)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
    }

}
