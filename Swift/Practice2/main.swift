import Foundation

var showTime = false

/*
 The current moment is stored
 The combinatorial function is called by passing the path of the entered file
 The time the program takes it is showed if the "-t" option was activated
 */
func read_file(contents : NSString) -> () {
    let start = NSDate().timeIntervalSince1970 * 1000
    BloodCompatibility().get_combinations(persons: contents.components(separatedBy: .newlines))
    if (showTime) {
        print("\nTotal time = \(NSDate().timeIntervalSince1970 * 1000 - start) milliseconds")
    }
}

/*
 The read_file() function will be called if the file exists
 and there are no problems to open it to read its contents
 */
func open_file(path : String) -> () {
    do {
        let contents = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
        read_file(contents: contents)
    } catch _ as NSError {
        print("Something went wrong")
    }
}

/*
 The program starts here.
 It is checked if the "-t" option has been entered to show the time it takes to run the program
 */
if (CommandLine.argc > 1  && CommandLine.arguments[2] == "-t") {
    showTime = true
}

open_file(path: CommandLine.arguments[1])
