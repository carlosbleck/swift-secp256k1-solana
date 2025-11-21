// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "secp256k1_solana",
    products: [
        .library(
            name: "secp256k1_solana",
            targets: ["secp256k1_solana"]
        ),
    ],
    dependencies: [
        // No dependencies
    ],
    targets: [
        .target(
            name: "Csecp256k1_solana",
            path: "./secp256k1/Classes/secp256k1",
            exclude: [
                // Core C files that cause duplicate symbols
                "src/secp256k1.c",
                "src/gen_context.c",
                "src/testrand.h",
                "src/testrand_impl.h",
                "src/tests.c",
                "src/tests_exhaustive.c",
                "src/bench_ecdh.c",
                "src/bench_ecmult.c",
                "src/bench_internal.c",
                "src/bench_recover.c",
                "src/bench_sign.c",
                "src/bench_verify.c",
                "src/bench.h",
                "src/asm",
                "src/java",
                "src/modules/ecdh/tests_impl.h",
                "src/modules/recovery/tests_impl.h",
                
                // Build artifacts
                "build-aux",
                "obj",
                "sage",
                
                // Swift wrapper folder
                "exporter"
            ],
            sources: [
                "include",
                "src/modules/ecdh",
                "src/modules/recovery"
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include")
            ]
        ),
        .target(
            name: "secp256k1_solana",
            dependencies: ["Csecp256k1_solana"],
            path: "./secp256k1/Classes/exporter",
            sources: ["."]
        ),
        .testTarget(
            name: "secp256k1_solanaTests",
            dependencies: ["secp256k1_solana", "Csecp256k1_solana"],
            path: "Tests/secp256k1_solanaTests"
        )
    ]
)
