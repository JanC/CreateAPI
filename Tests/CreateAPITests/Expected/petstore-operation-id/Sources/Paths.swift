// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths {
    public static var pets: Pets {
        Pets(path: "/pets")
    }

    public struct Pets {
        /// Path: `/pets`
        public let path: String

        /// List all pets
        public func get(limit: Int? = nil) -> Request<[petstore_operation_id.Pet]> {
            .get(path, query: makeGetQuery(limit)).id("listPets")
        }

        public enum GetResponseHeaders {
            /// A link to the next page of responses
            public static let next = HTTPHeader<String>(field: "x-next")
        }

        private func makeGetQuery(_ limit: Int?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(limit, forKey: "limit")
            return encoder.items
        }

        /// Create a pet
        public var post: Request<Void> {
            .post(path).id("createPets")
        }
    }
}

extension Paths.Pets {
    public func petID(_ petID: String) -> WithPetID {
        WithPetID(path: "\(path)/\(petID)")
    }

    public struct WithPetID {
        /// Path: `/pets/{petId}`
        public let path: String

        /// Info for a specific pet
        public var get: Request<petstore_operation_id.Pet> {
            .get(path).id("showPetById")
        }
    }
}

public enum Paths {}

private extension Request {
    func id(_ id: String) -> Request {
        var copy = self
        copy.id = id
        return copy
    }
}
