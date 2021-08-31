import Foundation
import NeedleFoundation
import RxSwift

// swiftlint:disable unused_declaration
private let needleDependenciesHash: String? = nil

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent") { component in
        return EmptyDependencyProvider(component: component)
    }

}

// MARK: - Providers

