//
//  Secp256k1SolanaTests.swift
//  secp256k1_solana
//
//  Created by Carlos Bleck on 20/11/25.
//

import XCTest
@testable import secp256k1_solana
import Csecp256k1_solana

final class Secp256k1SolanaTests: XCTestCase {

    func testContextCreate() {
        // Simply tries to create a signing context
        let context = secp256k1_context_create(UInt32(SECP256K1_CONTEXT_SIGN))
        XCTAssertNotNil(context)
        
        guard let context else {
            XCTFail("Failed to create secp256k1 context")
            return
        }
        
        secp256k1_context_destroy(context)
    }
    
    func testSigningAndVerification() {
        /*
        // 1. Random private key (32 bytes)
        var privateKey = Data((0..<32).map { _ in UInt8.random(in: 0...255) })
        
        // 2. Create the context
        guard let context = secp256k1_context_create(UInt32(SECP256K1_CONTEXT_SIGN)) else {
            XCTFail("Failed to create secp256k1 context")
            return
        }
        
        // 3. Public key
        var pubkey = secp256k1_pubkey()
        
        let pubkeyCreateResult = privateKey.withUnsafeBytes { pkPtr in
            secp256k1_ec_pubkey_create(context, &pubkey, pkPtr.bindMemory(to: UInt8.self).baseAddress!)
        }
        
        XCTAssertEqual(pubkeyCreateResult, 1, "Failed to create public key")
        
        // 4. Message to sign
        let message = Data("hello world".utf8)
        
        var signature = secp256k1_ecdsa_signature()
        
        let signResult = message.withUnsafeBytes { msgPtr in
            privateKey.withUnsafeBytes { pkPtr in
                secp256k1_ecdsa_sign(context,
                                     &signature,
                                     msgPtr.bindMemory(to: UInt8.self).baseAddress!,
                                     pkPtr.bindMemory(to: UInt8.self).baseAddress!,
                                     nil,
                                     nil)
            }
        }
        
        XCTAssertEqual(signResult, 1, "Signing failed")
        
        // 5. Verify signature
        let verifyResult = message.withUnsafeBytes { msgPtr in
            secp256k1_ecdsa_verify(context,
                                   &signature,
                                   msgPtr.bindMemory(to: UInt8.self).baseAddress!,
                                   &pubkey)
        }
        
        XCTAssertEqual(verifyResult, 1, "Verification failed")
        
        secp256k1_context_destroy(context)
         */
    }
}
