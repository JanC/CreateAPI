// The MIT License (MIT)
//
// Copyright (c) 2021-2022 Alexander Grebenyuk (github.com/kean).

import XCTest
import OpenAPIKit30
@testable import create_api

final class GenerateTests: GenerateBaseTests {
    func testPestore() throws {
        try testSpec(name: "petstore", package: "petstore-default")
    }
    
    func testEdgecases() throws {
        try testSpec(name: "edgecases", package: "edgecases-default")
    }

    func testDiscriminator() throws {
        try testSpec(name: "discriminator", package: "discriminator")
    }    
    
    func testGitHub() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "github"),
            "--output", temp.url.path,
            "--strict",
            "--package", "OctoKit",
            "--vendor", "github",
            "--config", config("""
            paths:
              overrideResponses:
                accepted: "Void"
              overridenBodyTypes:
                application/octocat-stream: String
            rename:
              enumCases:
                reactions-+1: "reactionsPlusOne"
                reactions--1: "reactionsMinusOne"
            """, ext: "yaml")
        ])
                
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "OctoKit")
    }
}
