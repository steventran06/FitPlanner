# this class will generate our secret number for us
class SecretNumber
  attr_accessor :secret_num

	def initialize
		puts "First, let's generate this secret number...\n \n"
		puts "     ^^      ..                                       ..
             []                                       []
           .:[]:_          ^^                       ,:[]:.
         .: :[]: :-.                             ,-: :[]: :.
       .: : :[]: : :`._            ^^         ,.': : :[]: : :.
     .: : : :[]: : : : :-._               _,-: : : : :[]: : : :.
 _..: : : : :[]: : : : : : :-._________.-: : : : : : :[]: : : : :-._
 _:_:_:_:_:_:[]:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:[]:_:_:_:_:_:_
 !!!!!!!!!!!![]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!![]!!!!!!!!!!!!!
 ^^^^^^^^^^^^[]^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^[]^^^^^^^^^^^^^
             []                                       []
             []                                       []
             []                                       []
  ~~^-~^_~^~/  \~^-~^~_~^-~_^~-^~_^~~-^~_~^~-~_~-^~_^/  \~^-~_~^-~~-
 ~ _~~- ~^-^~-^~~- ^~_^-^~~_ -~^_ -~_-~~^- _~~_~-^_ ~^-^~~-_^-~ ~^
    ~ ^- _~~_-  ~~ _ ~  ^~  - ~~^ _ -  ^~-  ~ _  ~~^  - ~_   - ~^_~
      ~-  ^_  ~^ -  ^~ _ - ~^~ _   _~^~-  _ ~~^ - _ ~ - _ ~~^ -
         ~^ -_ ~^^ -_ ~ _ - _ ~^~-  _~ -_   ~- _ ~^ _ -  ~ ^-
             ~^~ - _ ^ - ~~~ _ - _ ~-^ ~ __- ~_ - ~  ~^_-
                 ~ ~- ^~ -  ~^ -  ~ ^~ - ~~  ^~ - ~
                 
                 Do you hear birds...? \n \n"
		@secret_num = rand(1..10)
		# FOR TESTING
		puts "Secret number is #{@secret_num} for TESTING!\n \n"
    @secret_num = secret_num
	end

# return secret number as non SecretNumber class
  def return_secret_num
    secret_num
  end

end