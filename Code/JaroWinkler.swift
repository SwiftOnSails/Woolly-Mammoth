import Foundation

func sort(s1:String, s2:String) -> (String, String) {
    if countElements(s1) <= countElements(s2) {
        return (s1, s2)
    }

    return (s2, s1)
}

public func JaroWinklerDistance(in_s1:String, in_s2:String) -> Float {
    let (s1, s2) = sort(in_s1.lowercaseString, in_s2.lowercaseString)

    if countElements(s1) == 1 || countElements(s2) == 1 {
        return 0
    }

    var m = 0, t = 0, l = 0

    let window = floor(Float(max(countElements(s1), countElements(s2))) / 2 - 1)

    let s1_array = Array(s1)
    let s2_array = Array(s2)
    var idx = 0

    for char1 in s1 {
        if char1 == s2_array[idx] {
            m++

            if idx == l && idx < 4 {
                l++
            }
        } else {
            if contains(s2_array, char1) {
                let gap = find(s2_array, char1)! - idx

                if gap <= Int(window) {
                    m++

                    for k in idx..<countElements(s1_array) {
                        if find(s2_array, s1_array[k]) <= idx {
                            t++
                        }
                    }
                }
            }
        }

        idx++
    }

    let distanceFirst = Float(m)/Float(countElements(s1)) + Float(m)/Float(countElements(s2))
    let distanceSecond = (Float(m)-floor(Float(t)/Float(2)))/Float(m)
    let distance = (distanceFirst + distanceSecond) / Float(3)
    let jwd = distance + (Float(l) * Float(0.1) * (Float(1) - distance))

    return jwd
}
