# Swift Fundamentals: Control Flow & Range Analyzer

[![Swift Version](https://img.shields.io/badge/Swift-5.9%20%7C%206.0-F05138?logo=swift&logoColor=white)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-macOS%20%7C%20iOS%20%7C%20Linux-blue)](https://apple.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A clean, modular Swift implementation showcasing core language fundamentals, procedural logic, numerical type casting, pattern matching, defensive range validation, and modular function design.

---

## 🚀 Key Competencies & Skills Demonstrated

- **Control Flow & Pattern Matching**: Utilizing Swift's expressive `switch` syntax with half-open (`..<`) and closed (`...`) range pattern matching.
- **Type Safety & Numerical Precision**: Explicit casting between integer arithmetic (`Int`) and floating-point representations (`Double`) to prevent integer truncation errors during average computations.
- **Modular Function Composition**: Designing single-responsibility functions where statistical aggregation procedures reuse granular classification utilities.
- **Defensive Programming & Input Validation**: Guarding against invalid bounds ($min > max$) and enforcing minimum sample sizes ($N \ge 5$) with early-return error handling.
- **Mathematical Formulations**: Implementing the standard thermodynamic temperature conversion formula:
  $$\text{Fahrenheit} = \left(\text{Celsius} \times \frac{9}{5}\right) + 32$$

---

## 📂 Repository Structure

```tree
swift-fundamentals-control-flow/
├── Sources/
│   └── main.swift                   # Standalone Swift executable script
├── TemperatureAnalyzer.playground/  # Interactive Xcode Playground environment
│   ├── Contents.swift
│   └── contents.xcplayground
├── .gitignore                       # Swift & Xcode environment exclusions
├── LICENSE                          # MIT Open Source License
└── README.md                        # Project documentation
```

---

## 🔍 Code Architecture & Implementation

### 1. Mathematical Unit Conversion
Converts Celsius to Fahrenheit with high precision:
```swift
func celsiusToFahrenheit(_ celsius: Double) -> Double {
    return (celsius * 9.0 / 5.0) + 32.0
}
```

### 2. Pattern Matching Classification
Categorizes temperatures into discrete bands using pattern-matched interval ranges:
```swift
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
```

### 3. Range Statistical Engine
Performs iterative range analysis with boundary validation and statistical aggregation:
```swift
func analyzeTemperatureRange(from minCelsius: Int, to maxCelsius: Int) {
    if minCelsius > maxCelsius {
        print("Invalid range: minimum must be <= maximum.")
        return
    }
    
    let numberOfValues = maxCelsius - minCelsius + 1
    if numberOfValues < 5 {
        print("Error: Range must include at least 5 temperature values.")
        return
    }
    
    var sum = 0
    for temp in minCelsius...maxCelsius {
        let description = temperatureCategory(temp)
        print("\(temp)°C - \(description)")
        sum += temp
    }
    
    let average = Double(sum) / Double(numberOfValues)
    print("Average temperature: \(average)°C")
}
```

---

## 💻 Sample Terminal Output

```text
==================================================
 Swift Fundamentals: Control Flow & Range Analyzer
==================================================

--- 1. Temperature Conversion (Celsius -> Fahrenheit) ---
  0.0°C = 32.0°F
  25.0°C = 77.0°F
  50.0°C = 122.0°F
  75.0°C = 167.0°F
  100.0°C = 212.0°F

--- 2. Pattern-Matched Classification ---
  0°C -> Cold
  5°C -> Cool
  12°C -> Cool
  13°C -> Warm
  24°C -> Warm
  25°C -> Hot

--- 3. Range Statistical Analysis ---
📊 Temperature Analysis from -5°C to 28°C:
───────────────────────────────────────────────────
  • -5°C -> Cold
  • -4°C -> Cold
  ...
  • 28°C -> Hot
───────────────────────────────────────────────────
📈 Total Data Points Analyzed : 34
🌡️  Average Temperature        : 11.50°C
───────────────────────────────────────────────────
```

---

## 🛠️ How to Run

### Option 1: Swift Command Line
Run directly via the Swift interpreter:
```bash
swift Sources/main.swift
```

### Option 2: Xcode Playground
1. Double-click `TemperatureAnalyzer.playground` in macOS Finder or open via Xcode.
2. Press `Shift + Return` or click the Play button to execute interactively.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
