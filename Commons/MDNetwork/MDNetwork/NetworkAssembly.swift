//
//  NetworkAssembly.swift
//  MDNetwork
//
//  Created by Songsit Pantayang on 26/10/2567 BE.
//

import Swinject
import MDFactory

public class NetworkAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Swinject.Container) {
        container.register(NetworkSessionManager.self) { _ in NetworkSessionManagerLogic() }
        container.register(NetworkEndpointManager.self) { _ in NetworkDefaultEndpointManager() }
        container.register(Network.self) { r in
            let sessionManager = r.resolve(NetworkSessionManager.self)!
            let defaultEndpoint = r.resolve(NetworkEndpointManager.self)!
            return Networking(sessionManager: sessionManager, defaultEndpoint: defaultEndpoint)
        }
    }
    
}
