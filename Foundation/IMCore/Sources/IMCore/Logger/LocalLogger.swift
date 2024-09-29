//
//  LocalLogger.swift
//  IMCore
//
//  Created by DARRAN on 29/9/2567 BE.
//

public class LocalLoggers: Loggers {
    
    let dateTime: DateTime
    
    public init(dateTime: DateTime) {
        self.dateTime = dateTime
    }
    
    public func log(_ message: String) {
        print("\(dateTime.now()): \(message)")
    }

}
