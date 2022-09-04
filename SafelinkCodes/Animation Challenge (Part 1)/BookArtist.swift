//
//  BookArtist.swift
//  SafelinkCodes
//
//  Created by Augustine Francis on 03/09/2022.
//

import SwiftUI

struct BookArtist: View {
    @State var contentIndex: Int = 4
    @Environment(\.colorScheme) var colorScheme
    @State private var currentCategory: String = "Music"
    @State private var exploreIndex: Int = 4
    @Namespace var artworkAnimation
    var body: some View {
        NavigationView {
            ZStack(alignment:.top){
                BgView()
                VStack{
                    Carousel()
                        .padding(.vertical)
                    Spacer()
                    ExploreLinks()
                    Spacer()
                }
            }
            .navigationTitle("Book Artist")
        }
    }

    @ViewBuilder
    func BgView() -> some View{
        GeometryReader {
            proxy in
            let size = proxy.size
            TabView(selection: $contentIndex) {
                ForEach(artist.indices, id:\.self){
                    index in
                    Image(artist[index].artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .frame(width: size.width, height: size.height)
                        .ignoresSafeArea()
                        .tag(index)


                }
            }

            let color: Color = (colorScheme == .dark ? .black: .white)
            LinearGradient(colors: [
                .black,
                .clear,
                color.opacity(0.15),
                color.opacity(0.5),
                color.opacity(0.8),
                color,
                color,
            ], startPoint: .top, endPoint: .bottom)

            Rectangle().fill(.thinMaterial)
        }
        .ignoresSafeArea()
    }

    @ViewBuilder
    func CategoryButton() ->some View{
        HStack(spacing:0){
            ForEach(["Music", "Movie"], id: \.self){tab in
                Button(action: {}) {
                    Text(tab)
                        .foregroundColor(.white)
                        .padding(.vertical,6)
                        .padding(.horizontal, 20)
                }


            }
        }
    }
    @ViewBuilder
    func Carousel() -> some View{
        HStack(spacing:20){
            ForEach(artist.indices, id:\.self){
                index in
                NavigationLink(destination: ArtistDetails(artist:artist[index])) {
                    Image(artist[index].artwork)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 240, height: 340)
                        .cornerRadius(12)
                        .scaleEffect(contentIndex == artist[index].id ? 1.2: 1)
                        .padding(contentIndex == artist[index].id ? 25: 0)
                }
            }
        }
        .matchedGeometryEffect(id: "ArtistArtwork", in: artworkAnimation)
        .modifier(ScrollingHStackModifier(items: artist.count, itemWidth: 240, itemSpacing: 20, currentIndex: $contentIndex))

    }

    @ViewBuilder
    func ExploreLinks() -> some View{
        VStack(alignment:.center){
            HStack(alignment:.center, spacing:165){
                Spacer()
                Text("Popular Artist")
                    .font(.callout.bold())
                    .foregroundColor(.white)

                Text("See more")
                    .font(.callout.bold())
                    .foregroundColor(.blue)
                Spacer()
            }
            .padding(.horizontal)
            HStack(alignment:.center, spacing:5){
                Spacer()
                ForEach(artist.indices.shuffled(), id:\.self){
                    index in
                    Image(artist[index].artwork)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(12)
                }
                Spacer()
            }.modifier(ScrollingHStackModifier(items: artist.count, itemWidth: 100, itemSpacing: 5, currentIndex: $exploreIndex))

        }
        .padding(.horizontal)
    }


}

struct ArtistDetails: View{
    @State var artist: Artist
    @Environment(\.colorScheme) var colorScheme
    var body: some View{
        ZStack{
            BgView()
            ScrollView(.vertical, showsIndicators:false) {
                VStack(alignment:.center, spacing:5){
                    Image(artist.artwork)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 240, height: 340)
                        .cornerRadius(12)
                    Text(artist.artist.uppercased())
                        .font(.title3.bold())
                        .foregroundColor(.white)
                    Spacer()
                    Text(artistText)
                        .foregroundColor(.white)
                        .font(.body.bold())
                        .padding(.horizontal)
                }
            }

        }
        .navigationBarHidden(false)
    }

    @ViewBuilder
    func BgView() -> some View{
        GeometryReader {
            proxy in
            let size = proxy.size
            Image(artist.artwork)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .frame(width: size.width, height: size.height)
                .ignoresSafeArea()

            let color: Color = (colorScheme == .dark ? .black: .white)
            LinearGradient(colors: [
                .black,
                .clear,
                color.opacity(0.15),
                color.opacity(0.5),
                color.opacity(0.8),
                color,
                color,
            ], startPoint: .top, endPoint: .bottom)

            Rectangle().fill(.thinMaterial)
        }
        .ignoresSafeArea()
    }
}

struct BookArtist_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
