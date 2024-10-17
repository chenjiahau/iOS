import Foundation

extension MeasurementFormatter {
    static func status(value: Bool) -> String {
        if value {
            return "Completed"
        } else {
            return "Not Completed"
        }
    }
}
