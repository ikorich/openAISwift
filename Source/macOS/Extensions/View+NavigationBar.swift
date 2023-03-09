//
//  View+NavigationBar.swift
//  openAISwift
//
//  Created by vitalii on 08.03.2023.
//  Copyright © 2023 IGR Soft. All rights reserved.
//

#if canImport(AppKit)

import SwiftUI

extension View {
    
    /// Hides the navigation bar for this view.
    ///
    /// This modifier only takes effect when this view is inside of and visible
    /// within a `NavigationView`.
    ///
    /// - Parameters:
    ///     - hidden: A Boolean value that indicates whether to hide the
    ///       navigation bar.
    public func navigationBarHidden(_ hidden: Bool) -> some View {
        self
    }
    
    
    /// Configures the title in the navigation bar for this view.
    ///
    /// This modifier only takes effect when this view is inside of and visible
    /// within a `NavigationView`.
    ///
    /// - Parameters:
    ///     - title: A description of this view to display in the navigation
    ///       bar.
    public func navigationBarTitle(_ title: Text) -> some View  {
        self
    }
    
    
    /// Configures the title in the navigation bar for this view.
    ///
    /// This modifier only takes effect when this view is inside of and visible
    /// within a `NavigationView`.
    ///
    /// - Parameters:
    ///     - titleKey: A key to a localized description of this view to display
    ///       in the navigation bar.
    public func navigationBarTitle(_ titleKey: LocalizedStringKey) -> some View  {
        self
    }
    
    public func navigationBarItems<T>(trailing: T) -> some View where T : View {
        VStack(alignment: .trailing) {
            self
            trailing
        }
    }
}

#endif
