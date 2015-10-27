# Modules and Mixins in Ruby

## Objectives

1. Learn about modules––another way to lend functionality across classes. 

## Introduction

In the previous lesson, we discussed the concept of inheritance. We learned that through subclasses a certain class under a super class, the subclass has access to all of the methods of it's parent. Inheriting one class from another makes sense the subclass can be understood as a child or subordinate of the super class. For example, a car is a type of vehicle, so it makes sense to *inherit* the `Car` class from the `Vehicle` class. 

Let's think about a slightly different type of example, one that is less hierarchical. We could easily envision writing an app that models the environment of a dance performance. Such an app might have a `Ballerina` class. Ballerinas, we know, perform dances. Similarly, we could imagine a little girl going to see the Nutcracker ballet one Christmas, coming home and wanting to practice all of the ballet moves from the show. So, we might write a `Kid` class in which an instance of that class, our little girl who has gone to see the ballet, should have access to all those ballet moves (her performance skill not withstanding). This situation is not hierarchical, like our `Car` and `Vehicle` example. Instead, `Kid` and `Ballerina` simply need to share some functionality, without being related in any other meaningful way. 

This is where modules come it. Modules allow us to collect and bundle a group of methods and make those methods available to any number of classes. In this exercise, we'll be defining a `Dance` module and making it available to both the `Ballerina` and `Kid` class. 

## Code Along I: Including Module Methods as Instance Methods

***This is a code along exercise. Fork and clone this repo by clicking the github link at the top of the page. There are no tests to pass. Just follow along with the walk-through below to get your code working***.

### Step I: Defining Our Module

We'll code our `Dance` module inside the `lib/dance_module.rb` file. Open up that file and define you module with the following code: 

```ruby
module Dance
end
``` 

Let's give our `Dance` module some fabulous moves:

```ruby
module Dance
  def twirl
    "I'm twirling!"
  end

  def jump
    "Look how high I'm jumping!"
  end

  def pirouette
    "I'm doing a pirouette"
  end

  def take_a_bow
    "Thank you, thank you. It was a pleasure to dance for you all."
  end
end 
```

Okay, now we'll define our `Kid` class and tell it to *include* the capabilities of the `Dance` module. 

### Step 2: Defining the Classes

Open up `lib/kid.rb` and define your `Kid` class: 

```ruby
class Kid
end
```

Let's do the same for the `Ballerina` class in `lib/ballerina.rb`:

```ruby
class Ballerina
end
```

Now we're ready to include our module in our classes: 


### Step 3: Including the Module

To lend our two classes all of the methods of the `Dance` module, we use the `include` keyword: 


```ruby
class Kid
  include Dance
  
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end
```

```ruby
class Ballerina
  include Dance
  
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end
```

If we use `include` keyword, we allow our classes to use all of the methods of the included module as *instance* methods. We'll talk about how to lend a module's methods as *class* methods in a minute. 

Now that we've included the module, open up `bin/dance_party` and get familiar with with following code: 

```ruby
require_relative "../lib/kid.rb"
require_relative "../lib/ballerina.rb"

angelina = Kid.new("Anglina")
mikhail_barishnkov = Ballerina.new("Mikhail")

puts "#{angelina.name} says: #{angelina.twirl}"
puts "#{mikhail_barishnkov.name} says: #{mikhail_barishnkov.take_a_bow}"
```

Now, run the file by typing `ruby bin/dance_party` and you should see the following output in your terminal: 

```bash
Anglina says: I'm twirling!
Mikhail says: Thank you, thank you. It was a pleasure to dance for you all.
```

## Code Along II: Extending Module Methods as Class Methods

In order to lend a module's methods to a class as *class methods*, we use the `extend` keyword. Let's write yet another module that we can extend into our classes as class methods. For the purposes of this example, let's create a shareable class method, `metadata`, which will report on some pertinent (shared) information regarding both classes.  

Open up the `lib/class_method_module.rb` and define the following module and methods:

```ruby
module MetaDancing

  def metadata
    "This class produces object that love to dance."
  end
end
```

Let's `extend` this module into both the `Kid` and `Ballerina` classes: 

```ruby
class Ballerina
  extend MetaDancing
end
```

```ruby
class Kid
  extend MetaDancing
end
```

Now, open up the bin/extending file and familiarize yourself with the following code:

```ruby
require_relative "../lib/kid.rb"
require_relative "../lib/ballerina.rb"

puts Kid.metadata
puts Ballerina.metadata
```

Run the file with `ruby bin/extending` and you should see the following output in your terminal: 

```bash
This class produces objects that love to dance.
This class produces objects that love to dance.
```

## Conclusion

That's it! Now that we are familiar with several methods of sharing code between classes, you're ready to move on to the next few labs.
