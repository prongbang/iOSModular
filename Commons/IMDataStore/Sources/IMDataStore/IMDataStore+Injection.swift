//
//  IMDataStore+Injection.swift
//  IMDataStore
//
//  Created by DARRAN on 29/9/2567 BE.
//

import Factory

extension Container {
    var imDataStore: Factory<IMDataStore> {
        self { IMDataStoreLogic() }
    }
}
