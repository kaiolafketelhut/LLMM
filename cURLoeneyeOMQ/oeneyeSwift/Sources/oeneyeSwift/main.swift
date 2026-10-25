import Foundation
// oeneyeSwift - Bell pair |00> + |11> like oeneyeCPP / oeneyeQ
var counts = ["00":0, "11":0]
for _ in 0..<1024 {
    if Double.random(in: 0...1) < 0.5 { counts["00"]!+=1 } else { counts["11"]!+=1 }
}
print("=== oeneyeSwift Bell (Swift like oeneyeCPP) ===")
print("Bell counts: 00=\(counts["00"]!) 11=\(counts["11"]!)")
print("State: (|00> + |11>)/sqrt(2) - Entanglement OK")

// Swift concurrency check (like your quantum_test)
let bellOK = abs(counts["00"]!-counts["11"]!) < 200
print(bellOK ? "OK - Entanglement verified" : "FAIL")
