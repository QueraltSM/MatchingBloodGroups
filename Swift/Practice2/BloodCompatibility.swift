import Foundation

var oldPatient = ""

class BloodCompatibility {
    
    var totalCombinations = 0
    var last_patient = ""
    var bloodCompatibility = ["A": ["A", "C"], // A+
        "Z": ["A", "Z", "C", "X"], // A-
        "B": ["B", "C"], // B+
        "Y": ["B", "Y", "C", "X"], // B-
        "C": ["C"], // AB+
        "X": ["C", "X"], // AB-
        "O": ["A", "B", "C", "O"], // O+
        "W": ["A", "Z", "B", "Y", "C", "X", "O", "W"]] // O-
    
    /*
     bloodCompatibility is a dictionary whose key is the blood type.
     If we got the key of letter that represents patient A, we can obtain
     its values, if the blood type of patient B is between these values,
     patient A can be a donor for B
     */
    
    func check_compatibility (bloodType_patient1 : String, bloodType_patient2: String) -> Bool {
        for blood in bloodCompatibility[String(bloodType_patient1)]! {
            if blood == bloodType_patient2 {
                return true
            }
        }
        return false
    }
    
    /*
     Given a vector with two positio/Users/QSM/Desktop/PRACTICAS 2/Python/bloodcomp.pyns, patient A and B,
     we get the last character (blood type)
     A list of patients that A can donate is printed
     */
    func getCompatibility(combination : [String] ) -> () {
        let patient1 = combination[0]
        let patient2 = combination[1]
        let p1_blood = String(patient1.last!)
        let p2_blood = String(patient2.last!)
        if (check_compatibility(bloodType_patient1: p1_blood, bloodType_patient2: p2_blood)) {
            if (last_patient != patient1) {
                last_patient = patient1
                print ("\nPatient ", patient1, "can donate to:")
            }
                print (patient2)
        }
    }
    
    func get_combinations(persons: [String]) {
        let combinations = Combination().getCombinations(persons: persons)
        var combinationsIterator = combinations.makeIterator()
        while let comb = combinationsIterator.next() {
            totalCombinations = totalCombinations + 1
            getCompatibility(combination: comb)
        }
        print ("\nTotal combinations = \(totalCombinations) combinations")
    }
}
