//
//  Log.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import Foundation

enum LogEvent: String {
  case error = "🔴"
  case warning = "🟡"
  case info = "🟢"
  case debug = "🔵"
  case verbose = "🟣"
}

func print(_ object: Any) {
  #if DEBUG
  Swift.print(object)
  #endif
}

class Log {
  
  static var dateFormat = "hh:mm:ss"
  static var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = dateFormat
    formatter.locale = Locale.current
    formatter.timeZone = TimeZone.current
    return formatter
  }

  class func error( _ object: Any,
                    filename: String = #file,
                    line: Int = #line,
                    funcName: String = #function) {
    print("\(LogEvent.error.rawValue) "
            + "\(Date().toString()) "
            + "\(sourceFileName(filePath: filename)):\(line) "
            + "\(funcName) -> "
            + "\(object)"
    )
  }
  
  class func warning( _ object: Any,
                      filename: String = #file,
                      line: Int = #line,
                      funcName: String = #function) {
      print("\(LogEvent.warning.rawValue) "
              + "\(Date().toString()) "
              + "\(sourceFileName(filePath: filename)):\(line) "
              + "\(funcName) -> "
              + "\(object)"
      )
  }
  
  class func info( _ object: Any,
                      filename: String = #file,
                      line: Int = #line,
                      funcName: String = #function) {
      print("\(LogEvent.info.rawValue) "
              + "\(Date().toString()) "
              + "\(sourceFileName(filePath: filename)):\(line) "
              + "\(funcName) -> "
              + "\(object)"
      )
  }
  
  class func debug( _ object: Any,
                      filename: String = #file,
                      line: Int = #line,
                      funcName: String = #function) {
      print("\(LogEvent.debug.rawValue) "
              + "\(Date().toString()) "
              + "\(sourceFileName(filePath: filename)):\(line) "
              + "\(funcName) -> "
              + "\(object)"
      )
  }
  
  class func verbose( _ object: Any,
                      filename: String = #file,
                      line: Int = #line,
                      funcName: String = #function) {
      print("\(LogEvent.verbose.rawValue) "
              + "\(Date().toString()) "
              + "\(sourceFileName(filePath: filename)):\(line) "
              + "\(funcName) -> "
              + "\(object)"
      )
  }

  private class func sourceFileName(filePath: String) -> String {
    let components = filePath.components(separatedBy: "/")
    return components.isEmpty ? "" : components.last!
  }
}

internal extension Date {
  func toString() -> String {
    return Log.dateFormatter.string(from: self as Date)
  }
}

