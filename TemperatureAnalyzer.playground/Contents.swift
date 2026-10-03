
// Function A: converts degrees Celsius to degrees Fahrenheit
func celsiusToFahrenheit(_ celsius: Double) -> Double {
    return (celsius * 9 / 5) + 32
}

// Function B: accepts a temperature in Celsius and displays a description representing it (temperature description)
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
// Function C: analyzes a temperature range (minimum 5 values required)
func analyzeTemperatureRange(from minCelsius: Int, to maxCelsius: Int) {
    
    if minCelsius > maxCelsius {
        print("Invalid range: minimum must be less than or equal to maximum.")
        return
    }
    
    let numberOfValues = maxCelsius - minCelsius + 1 // 10 to 12 = 3 values (10,11,12) not 12 - 10 = 2
    if numberOfValues < 5 {
        print("Error: Range must include at least 5 temperature values.")
        print("Your range from \(minCelsius) to \(maxCelsius) only has \(numberOfValues) value(s).")
        return
    }
    
    var sum = 0
    
    print("\nTemperature Analysis from \(minCelsius)°C to \(maxCelsius)°C:")
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    
    for temp in minCelsius...maxCelsius {
        let description = temperatureCategory(temp)
        print("\(temp)°C - \(description)")
        sum += temp
    }
    
    let average = Double(sum) / Double(numberOfValues)
    
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("Number of values analyzed: \(numberOfValues)")
    print("Average temperature: \(average)°C")
}

// Demonstration
print("\nFunction A: Celsius to Fahrenheit\n")
print("0°C = \(celsiusToFahrenheit(0))°F")
print("25°C = \(celsiusToFahrenheit(25))°F")
print("50°C = \(celsiusToFahrenheit(50))°F")
print("75°C = \(celsiusToFahrenheit(75))°F")
print("100°C = \(celsiusToFahrenheit(100))°F\n")

print("Function B: Temperature Description\n")
print("0°C - \(temperatureCategory(0))")
print("5°C - \(temperatureCategory(5))")
print("12°C - \(temperatureCategory(12))")
print("13°C - \(temperatureCategory(13))")
print("24°C - \(temperatureCategory(24))")
print("25°C - \(temperatureCategory(25))\n")

print("Function C: Range Analysis")
analyzeTemperatureRange(from: -5, to: 28)
print()
analyzeTemperatureRange(from: 13, to: 33)
print()
analyzeTemperatureRange(from: 10, to: 12)


/// AI usage and reflection section:
/*

1. How Did You Use AI?

 I used AI to help me recall the Celsius to Fahrenheit conversion formula. It provided (celsius * 9/5) + 32, which I then used in my code. I also used AI to understand how to add validation checks, such as making sure the range is valid and that there are at least 5 values. I wrote and adapted the code myself to meet the assignment requirements. I also used AI to check my AI usage and reflection section for spelling, grammar, and clarity to make sure it was easy to read.


2. How Did You Check and Change Things?

I tested the range function with different inputs like -5...18 and 13...33 to make sure it correctly printed Cold, Cool, Warm, and Hot for each temperature.

 I initially miscalculated the number of values in an inclusive range using max - min, which excludes one endpoint. I corrected this by adding +1 to account for both the minimum and maximum values.


3. What Did You Learn?

I learned how to design modular functions where one function can reuse another, which helps keep the code organized and easier to maintain. In this case, analyzeTemperatureRange used temperatureCategory.

I also learned that dividing integers in Swift drops the decimal part (for example, 7/2 becomes 3 instead of 3.5). I fixed this by converting the values to Double so I could get an accurate average.

What went good:

The code runs correctly and produces the expected results. After testing different inputs, I confirmed that all three functions work together as intended.

What went bad:

At first, I got confused between the range operators (... and ..<), which affected how I wrote some parts of the code. I also spent extra time trying to make the output look nicer than necessary, but I realized focusing on correctness first made things easier.

*/
