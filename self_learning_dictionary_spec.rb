require './self_learning_dictionary.rb'

describe "self learning dictionary" do
  dictionaryobj = SelfLearningDictionary.new
  output = File.new('dict.yml', 'r')
  dictionary=YAML.load(output.read)
  it "file should exists" do
    output = File.exists?('./dict.yml')
    output.should be true
  end
  it "dictionary should not be empty" do
    dictionary.should_not be nil
    dictionary.empty?.should_not be true
  end
  it "should contain CAR" do
    val = dictionary.has_key?("CAR")
    val.should be true
  end
  it "should not contain BIKE" do
    val = dictionary.has_key?("BIKE") 
    val.should_not be true
  end
  it "should add new data" do
    dictionary = dictionaryobj.add_to_dictionary(dictionary, "BIKE","bike is a two wheeler")
    val = dictionary.has_key?("BIKE") 
    val.should be true
  end
end
