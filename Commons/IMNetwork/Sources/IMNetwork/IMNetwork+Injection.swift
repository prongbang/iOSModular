//
//  IMNetwork+Injection.swift
//  IMNetwork
//
//  Created by DARRAN on 29/9/2567 BE.
//

import Factory

extension Container {
    var imNetwork: Factory<IMNetwork> {
        self { IMNetworkLogic() }
    }
}
