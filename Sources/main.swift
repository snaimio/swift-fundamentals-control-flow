import Foundation

// MARK: - Core Temperature Functions

/// Converts degrees Celsius to degrees Fahrenheit.
///
/// Formula: °F = (°C × 9/5) + 32
/// - Parameter celsius: Temperature in degrees Celsius.
/// - Returns: Temperature in degrees Fahrenheit.
func celsiusToFahrenheit(_ celsius: Double) -> Double {
    return (celsius * 9.0 / 5.0) + 32.0
}

/// Categorizes a given Celsius temperature into a descriptive string label using pattern matching.
///
/// - Parameter celsius: Integer temperature value in Celsius.
/// - Returns: Categorical classification ("Cold", "Cool", "Warm", "Hot").
func temperatureCategory(_ celsius: Int) -> String {
    switch celsius {
    case ..<5:
        return "Cold"
    case 5...12:
        return "Cool"
    case 13...24:
        return "Warm"
    default:
        return "Hot"
    }
}

/// Analyzes an inclusive range of temperatures, validating bounds and calculating statistical metrics.
///
/// Requires a minimum of 5 discrete values in the range.
/// - Parameters:
///   - minCelsius: Minimum temperature bound (inclusive).
///   - maxCelsius: Maximum temperature bound (inclusive).
func analyzeTemperatureRange(from minCelsius: Int, to maxCelsius: Int) {
    // 1. Validate bound order
    if minCelsius > maxCelsius {
        print("❌ Invalid range: minimum (\(minCelsius)°C) must be less than or equal to maximum (\(maxCelsius)°C).")
        return
    }
    
    // 2. Validate sample size (inclusive range calculation: max - min + 1)
    let numberOfValues = maxCelsius - minCelsius + 1
    if numberOfValues < 5 {
        print("❌ Error: Range must include at least 5 temperature values.")
        print("   Your range from \(minCelsius)°C to \(maxCelsius)°C only has \(numberOfValues) value(s).")
        return
    }
    
    var sum = 0
    
    print("\n📊 Temperature Analysis from \(minCelsius)°C to \(maxCelsius)°C:")
    print("───────────────────────────────────────────────────")
    
    // 3. Iterate through range and evaluate categories modularly
    for temp in minCelsius...maxCelsius {
        let description = temperatureCategory(temp)
        print("  • \(temp)°C -> \(description)")
        sum += temp
    }
    
    // 4. Calculate floating-point mean average
    let average = Double(sum) / Double(numberOfValues)
    
    print("───────────────────────────────────────────────────")
    print("📈 Total Data Points Analyzed : \(numberOfValues)")
    print("🌡️  Average Temperature        : \(String(format: "%.2f", average))°C")
    print("───────────────────────────────────────────────────\n")
}

// MARK: - Demonstrations & Test Executions

func runDemonstration() {
    print("==================================================")
    print(" Swift Fundamentals: Control Flow & Range Analyzer")
    print("==================================================")
    
    print("\n--- 1. Temperature Conversion (Celsius -> Fahrenheit) ---")
    let testCelsiusValues: [Double] = [0.0, 25.0, 50.0, 75.0, 100.0]
    for temp in testCelsiusValues {
        let fahrenheit = celsiusToFahrenheit(temp)
        print("  \(temp)°C = \(fahrenheit)°F")
    }
    
    print("\n--- 2. Pattern-Matched Classification ---")
    let testCategories = [0, 5, 12, 13, 24, 25]
    for temp in testCategories {
        print("  \(temp)°C -> \(temperatureCategory(temp))")
    }
    
    print("\n--- 3. Range Statistical Analysis ---")
    print("Test Case A: Valid Negative-to-Positive Range")
    analyzeTemperatureRange(from: -5, to: 28)
    
    print("Test Case B: Valid Warm Summer Range")
    analyzeTemperatureRange(from: 13, to: 33)
    
    print("Test Case C: Invalid Small Sample Range (< 5 values)")
    analyzeTemperatureRange(from: 10, to: 12)
}

runDemonstration()
