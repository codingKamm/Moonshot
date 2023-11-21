//
//  ResizeImageView.swift
//  Moonshot
//
//  Created by Cameron Warner on 11/21/23.
//

import SwiftUI

struct ResizeImageView: View {
    var body: some View {
        Image(.horror) //can use .imageTitle instead of strings
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
//         We're saying we want to give this image a frame relative to the horizontal size of its parent. We aren't specifying a vertical size; more on that in a moment.
//        SwiftUI then runs a closure where we're given a size and an axis. For us the axis will be .horizontal because that's the one we're using, but this matters more when you create relative horizontal and vertical sizes. The size value will be the size of our container, which for this image is the full screen.
//        We need to return the size we want for this axis, so we're sending back 80% of the container's width.
    }
}

#Preview {
    ResizeImageView()
}
