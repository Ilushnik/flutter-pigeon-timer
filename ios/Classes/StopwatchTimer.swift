import Foundation
import Foundation
import Combine


class StopwatchTimer{
    var intValue: Int = 0
    private var timer: Timer?
    var onValueChanged: ((Int) -> Void)?
    
    // Starts the timer
    func start() {
        // Invalidate any existing timer
        timer?.invalidate()
        
        // Reset counter
        intValue = 0
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(incrementValue), userInfo: nil, repeats: true)
        }
    }
    
    /// Stop method to stop the timer
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    // Method that gets called by the timer to increment the value
    @objc private func incrementValue() {
        intValue += 1
        // Call the callback function whenever the value changes
        onValueChanged?(intValue)
    }
}

