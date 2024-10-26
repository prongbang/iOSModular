//
//  AppAssembler.swift
//  App
//
//  Created by prongbang on 26/10/2567 BE.
//

import Swinject
import MDCore
import MDFactory
import MDNetwork
import MDDataStore
import MDCrypto
import MDSetting
import MDProfile
import MDHome

public class AppAssembler {

    static func registerDependencies() {
        InjecterAssempler.shared.apply(
            assemblies: [
                CoreAssembly(),
                CryptoAssembly(),
                DataStoreAssembly(),
                NetworkAssembly(),
                AppAssembly(),
                SettingAssembly(),
                ProfileAssembly(),
                HomeAssembly(),
            ])
    }

}
