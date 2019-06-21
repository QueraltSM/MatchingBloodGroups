class PROCESS
  require_relative 'ITERATOR'
  $blood_compatibility = {"A" => ["A", "C"], # A+
        "Z" => [ "A", "Z", "C", "X" ], # A-
        "B" => ["B", "C"], # B+
        "Y" => ["B", "Y", "C", "X"], # B-
        "C" => ["C"], # AB+
        "X" => ["C", "X"], # AB-
        "O" => ["A", "B", "C", "O"], # O+
        "W" => ["A", "Z", "B", "Y", "C", "X", "O", "W"]} # O-

  def read(path)
    $t1 = Time.now  # Init procedure timestamp
    persons = []
    IO.foreach(path) do |line| # Get all patients from file iterate each line
      line.chomp!  # Remove trailing whitespace.
      persons.push(line.split(":"))  # Saving data split :
    end
    get_combinations(persons) # Get blood type
  end

  # Checks blood compatibility between two persons
  def check_compatibility(patient1_blood, patient2_blood)
      $blood_compatibility[patient1_blood].each do |blood|
        if blood == patient2_blood
            return true
        end
      end
      return false
  end

# Gets the list of all compatible persons
  def get_compatibility(combination)
      last_patient = ""
      patient1 = combination.first
      patient2 = combination.last
      p1_blood = patient1.last
      p2_blood = patient2.last
      if check_compatibility(p1_blood, p2_blood)
        if $last_patient != patient1
          $last_patient = patient1
          print"\n\nPatient #{patient1[0]} can donate to:\n"
        end
        print "#{patient2[0]}:#{p2_blood}\n"
      end
  end

# Gets all combinations without repetition of the given persons
  def get_combinations(persons)
      total_combinations = 0
      persons.combination(2).each do |comb|
        total_combinations += 1
        get_compatibility(comb)
      end
      puts "\nTotal combinations: #{total_combinations} combinations"
  end
end
