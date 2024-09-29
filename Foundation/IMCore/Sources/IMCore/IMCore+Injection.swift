//
//  IMCore+Injection.swift
//  IMCore
//
//  Created by DARRAN on 29/9/2567 BE.
//

import Factory

extension Container {
    public var logger: Factory<Loggers> {
        self { LocalLoggers(dateTime: self.dateTime()) }
    }
    public var dateTime: Factory<DateTime> {
        self { LocalDateTime() }
    }
}

