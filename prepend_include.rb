  # In this task you should use #prepend and #include methods
  # in different combinations to achieve desired result, described at the bottom
  # Hint: class method #ancestors should help you to understand ancestors chain in different cases
  # Good Luck!
  
  module A
    def hello
      super if defined?(super)
      puts "hello from A"
    end
  end

  module B
    def hello
      super if defined?(super)
      puts "hello from B"
    end
  end

  class C
    include A
    prepend B
    #include B
    
    def hello
      super if defined?(super)
      puts "hello from C"
    end
  end

  class D 
    include A
    include B
    def hello
      super if defined?(super)
      puts "hello from C"
    end
  end  

 class E 
      include B
      include A
  def hello
      super if defined?(super)
      puts "hello from C"
    end
 end 

 class F 
      prepend B
      prepend A
  def hello
      super if defined?(super)
      puts "hello from C"
    end
 end 

 class G 
      prepend A
      prepend B
  def hello
      super if defined?(super)
      puts "hello from C"
    end
 end 

C.new.hello  # should be called in order => A,C,B
D.new.hello  # should be called in order => A,B,C
E.new.hello  # should be called in order => B,A,C
F.new.hello  # should be called in order => C,B,A
G.new.hello  # should be called in order => C,A,B
