class MAIN
  require_relative 'PROCESS'
  c = PROCESS.new #Run process
  start = Time.now
  c.read(ARGV[0])
    if ARGV[1] == "-t"
      puts "\nTotal execution time: #{(Time.now-start) * 1000} milliseconds"
    end
end
