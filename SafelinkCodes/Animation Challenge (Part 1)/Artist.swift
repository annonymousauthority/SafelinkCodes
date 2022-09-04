//
//  Artist.swift
//  SafelinkCodes
//
//  Created by Augustine Francis on 03/09/2022.
//

import Foundation


struct Artist: Hashable{
    var id: Int
    var artist: String
    var artwork: String
}

var artist: [Artist] = [
    Artist(id: 4, artist: "Eminem", artwork: "eminem"),
    Artist(id: 3, artist: "Arrdee", artwork: "arrdee"),
    Artist(id: 2, artist: "Beyonce", artwork: "beyonce"),
    Artist(id: 1, artist: "J Cole", artwork: "j_cole"),
    Artist(id: 0, artist: "Burna Boy", artwork: "burna-boy")
]

var artistText: String = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exercitation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.  Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci"
