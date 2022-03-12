// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: developers.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct GetDevelopersResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var developers: [GetDevelopersResponse.Developer] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  struct Developer {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var id: Int32 = 0

    var name: String = String()

    var surname: String = String()

    var age: Int32 = 0

    var platform: GetDevelopersResponse.Developer.Platform = .iOs

    var bald: Bool = false

    var unknownFields = SwiftProtobuf.UnknownStorage()

    enum Platform: SwiftProtobuf.Enum {
      typealias RawValue = Int
      case iOs // = 0
      case react // = 1
      case UNRECOGNIZED(Int)

      init() {
        self = .iOs
      }

      init?(rawValue: Int) {
        switch rawValue {
        case 0: self = .iOs
        case 1: self = .react
        default: self = .UNRECOGNIZED(rawValue)
        }
      }

      var rawValue: Int {
        switch self {
        case .iOs: return 0
        case .react: return 1
        case .UNRECOGNIZED(let i): return i
        }
      }

    }

    init() {}
  }

  init() {}
}

#if swift(>=4.2)

extension GetDevelopersResponse.Developer.Platform: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [GetDevelopersResponse.Developer.Platform] = [
    .iOs,
    .react,
  ]
}

#endif  // swift(>=4.2)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension GetDevelopersResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "GetDevelopersResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "developers"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.developers) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.developers.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.developers, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: GetDevelopersResponse, rhs: GetDevelopersResponse) -> Bool {
    if lhs.developers != rhs.developers {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GetDevelopersResponse.Developer: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = GetDevelopersResponse.protoMessageName + ".Developer"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "name"),
    3: .same(proto: "surname"),
    4: .same(proto: "age"),
    5: .same(proto: "platform"),
    6: .same(proto: "bald"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt32Field(value: &self.id) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.surname) }()
      case 4: try { try decoder.decodeSingularInt32Field(value: &self.age) }()
      case 5: try { try decoder.decodeSingularEnumField(value: &self.platform) }()
      case 6: try { try decoder.decodeSingularBoolField(value: &self.bald) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.id != 0 {
      try visitor.visitSingularInt32Field(value: self.id, fieldNumber: 1)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 2)
    }
    if !self.surname.isEmpty {
      try visitor.visitSingularStringField(value: self.surname, fieldNumber: 3)
    }
    if self.age != 0 {
      try visitor.visitSingularInt32Field(value: self.age, fieldNumber: 4)
    }
    if self.platform != .iOs {
      try visitor.visitSingularEnumField(value: self.platform, fieldNumber: 5)
    }
    if self.bald != false {
      try visitor.visitSingularBoolField(value: self.bald, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: GetDevelopersResponse.Developer, rhs: GetDevelopersResponse.Developer) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.name != rhs.name {return false}
    if lhs.surname != rhs.surname {return false}
    if lhs.age != rhs.age {return false}
    if lhs.platform != rhs.platform {return false}
    if lhs.bald != rhs.bald {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GetDevelopersResponse.Developer.Platform: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "iOS"),
    1: .same(proto: "React"),
  ]
}