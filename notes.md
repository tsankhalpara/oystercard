# Notes #

## Debugging:

NameError
./spec/oystercard_spec
rb:1
given name is invalid or undefined (can't find class)

What file name conventions Ruby classes use?
lib, spec.
e.g lib -> test.rb
    spec -> test_spec.rb


## Interview Questions:

What happens if the class name is in CamelCase?
The class remains a class (it must be CamelCase).

Explain what test-driven development is and what its advantages are.
Begin with writing a failing rspec test. Read rspec errors. Write source-code based on rspec test errors.

Unit test structure:
it 'adds 1 + 2' do
  expect(1+2).to eq 3
end

What are Ruby symbols? How are they different from strings? What are their advantages?
Symbols are strings that are immutable. ID is the same wherever called.

What is a Ruby class? What is an instance of a class?
A Ruby class describes the behaviour of methods. An instance of a class is a version of class with a given ID.

What's a class constructor? What is the initialize method? How are they different?
A class constructor is a method that automatically runs when the class instance is created. The initialize method is an example of a class constructor, it automatically runs when an instance of the class is created.

What are exceptions in Ruby? Why do they have messages associated with them? Exceptions are errors - they have messages related to them so we know what type of error they are.

How can you check an expression raises an error with RSpec? Why do you have to pass the code as a block to do this?
We're not evaluating an object we're evaluating the definition as a whole - not expecting a value output.

What are constants and how are they different from variables? Why use them?
Constants are immutable, variables mutable
Constants can be called outside the method, variables have to be inside.

What does the DRY acronym mean? Why is it important to keep your code DRY?
DO NOT REPEAT YOURSELF - readable, easy to understand by others


## Misc.

it 'can top up the balance' do
  expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
end
