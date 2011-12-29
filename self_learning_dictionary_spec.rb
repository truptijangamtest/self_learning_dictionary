require './self_learning_dictionary.rb'

   
describe "self learning dictionary" do
    dictionaryobj = SelfLearningDictionary.new

     it "dictionary should not be empty" do
         dictionaryobj.dictionary.should.not be {}
     end
     it "should contain car" do
         val = dictionaryobj.dictionary.has_key?("car")
         val.should be true
     end
     it "should not contain bike" do
         val = dictionaryobj.dictionary.has_key?("bike") 
         val.should_not be true
     end
     it "should add new data" do
         doctionaryobj.dictionary = dictionaryobj.dictionary.merge("bike" => "bike is a two wheeler")
         val = dictionaryobj.dictionary.has_key?("bike") 
         val.should be true
     end
end
