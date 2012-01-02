require 'yaml' 
class SelfLearningDictionary

  def print_self_learning_dictionary()

    dictionary = Hash.new{}
    if File.exist? "dict.yml"
      #Creating Hash for storing key-value pairs
      output = File.new('dict.yml', 'r')
      #dictionary={ 'CAR'=>'A car is a vehicle with four wheelers.' }
      dictionary=YAML.load(output.read)
    else
      @dict = {"CAR" => "A car is a vehicle with four wheelers." }
      output = File.new('dict.yml', 'w')
      output.puts YAML.dump(@dict)
      output.close

      output = File.new('dict.yml', 'r')
      #dictionary={ 'CAR'=>'A car is a vehicle with four wheelers.' }
      dictionary=YAML.load(output.read)
    end

    # Show welcome message to user, also show a message saying that how to end the program
    puts "Welcome to the self-learning dictionary!"
    puts "Enter END to exit."
    puts "Please enter a word:"

    #Use std I/O function gets to accept input from user
    #Accept input out of loop for first time and then 
    #inside the loop accept input till use enters END to terminate program

    #using gets.chomp so as to remove trailing \n of string accepted
    word = STDIN.gets.chomp

    #Use of while loop to iterate
    while (word != 'END') do

      #Use of has_key?() method to see if key present
      if dictionary.has_key?(word)
        puts dictionary[word]
      else
        puts "Sorry, not found. Add to Dictionary? (y / n):"
        ans = STDIN.gets.chomp

        if ans == 'y'
          puts "Please enter a value to add to dictionary:"
          description = STDIN.gets.chomp
          dictionary = add_to_dictionary(dictionary, word, description)

          #yaml_data = dictionary.to_yaml
          #YAML.dump(dictionary)
          outputforwrite = File.new('dict.yml', 'w')
          outputforwrite.puts YAML.dump(dictionary)
          puts "Added to dictionary succesfully."
          puts "Thank You!"
        end
      end
      puts "Please enter a word:"
      word = STDIN.gets.chomp
    end 
    puts "Thank you for using self learning dictionary."
  end

  def add_to_dictionary(dictionary, word,description)
    #Use of merge to merge the new values
    dictionary = dictionary.merge(word => description)
    return dictionary
  end

  dictionaryobj = SelfLearningDictionary.new
  dictionaryobj.print_self_learning_dictionary
end

