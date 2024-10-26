//
//  Injected.swift
//  MDFactory
//
//  Created by prongbang on 26/10/2567 BE.
//

import Swinject

public enum InjectedSource {
    case container
    case assembly
}

@propertyWrapper
public struct Injected<Dependency> {
    private var dependency: Dependency?
    
    public init(_ source: InjectedSource = .assembly) {
        if source == .assembly {
            self.dependency = InjecterAssempler.shared.resolver.resolve(Dependency.self)
        } else {
            self.dependency = InjecterContainer.shared.resolve(Dependency.self)
        }
    }
    
    public var wrappedValue: Dependency {
        guard let dependency = dependency else {
            fatalError("Dependency \(Dependency.self) could not be resolved.")
        }
        return dependency
    }
    
    public var projectedValue: Dependency? {
        return dependency
    }
}
