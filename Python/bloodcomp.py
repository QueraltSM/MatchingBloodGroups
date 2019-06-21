from itertools import combinations

# Dictionary with compatible blood types:
# A = A+ | Z = A- | B = B+ | Y = B- | C = AB+ | X = AB- | O = O+ | W = O-
b_comp = {"A" : ["A", "C"],
          "Z" : ["A", "Z", "C", "X" ],
          "B" : ["B", "C"],
          "Y" : ["B", "Y", "C", "X"],
          "C" : ["C"],
          "X" : ["C", "X"],
          "O" : ["A", "B", "C", "O"],
          "W" : ["A", "Z", "B", "Y", "C", "X", "O", "W"]}

last_patient = ""
totalCombinations = 0

# Checks blood compatibility between two persons
def check_compatibility(patient1_blood, patient2_blood):
    for blood in b_comp[patient1_blood]:
        if blood == patient2_blood:
            return True
    return False

# Gets the list of all compatible persons
def get_compatibility(combination):
    patient1 = combination[0]
    patient2 = combination[1]
    p1_blood = patient1[len(patient1)-1]
    p2_blood = patient2[len(patient2)-1]

    global last_patient
    if check_compatibility(p1_blood, p2_blood):
        if last_patient != patient1:
            last_patient = patient1
            print "\nPatient ", patient1, "can donate to:"
        print patient2

# Gets all combinations without repetition of the given persons
def get_combinations(persons):
    global totalCombinations
    for comb in combinations(persons, 2):
        totalCombinations = totalCombinations + 1
        get_compatibility(comb)
    print "\nTotal combinations = ", totalCombinations, " combinations"
