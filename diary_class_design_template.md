# Diary Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

Diary => list, add(DiaryEntry instances), read_chunk, find_phone
DiaryEntry => init(title, contents)
TaskList => list, add
Task => init(@task)

```
│
│
│   ┌─────────────────────────┐
│   │         Diary           │           ┌──────────────────────┐
│   ├─────────────────────────┤           │        Task          │
│   │                         │           ├──────────────────────┤
│   │    List                 │           │                      │
│   │    Add                  │           │    init(@task)       │
         Count_words
│   │    Read_chunk           │           │    task              │
│   │    Find_Phone           │           │                      │
│   │                         │           │                      │
│   └─────────────┬───────────┘           └──────────▲───────────┘
│                 │                                  │
│                 │                                  │
│                 │                                  │
│                 │                                  │
│                 │                                  │
│                 │                                  │
│    ┌────────────▼────────────┐           ┌─────────┴───────────┐
│    │       DiaryEntry        │           │        TaskList     │
│    ├─────────────────────────┤           ├─────────────────────┤
│    │                         │           │                     │
│    │    init(title,contents) │           │     List            │
│    │    title                │           │     Add             │
│    │    contents             │           │                     │
│    │                         │           │                     │
│    │                         │           │                     │
│    └─────────────────────────┘           │                     │
│                                          ├─────────────────────┤


```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
  # contains list of all our entries
  end

  def add(entry)
  # add to list of entries
  # returns nothing
  end

  def list
  # returns all of our diary entries
  end

  def count_words
  # returns an integer of the entry
  end

  def read_chunk(wpm, minutes)
  # returns a string that can be read in the alotted time/speed
  end

  def find_phone
  # return a list of all phone numbers across all entries
  end
end

class DiaryEntry
  def initialize(title, contents)
  # stores title and contents of entry
  end

  def title
  # returns entry title
  end

  def content
  # returns entry content
  end
end

class Task
  def initialize(task)
  # stores task
  end

  def task
  # returns task
  end
end

class TaskList
  def add(task)
    # takes task to add to our list, is an instance of Task
  end

  def list
  # returns list of all our tasks
  end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# Diary Integration

# 1 
diary = Diary.new
entry_1 = DiaryEntry.new("Monday", "Walked the dog, it was great")
entry_2 = DiaryEntry.new("Tuesday", "Walked the cat, did not like it")
diary.add(entry_1)
diary.add(entry_2)
diary.list # => [entry_1, entry_2]

# 2
diary = Diary.new
entry_1 = DiaryEntry.new("Monday", "Walked the dog, it was great")
entry_2 = DiaryEntry.new("Tuesday", "Walked the cat, did not like it")
diary.add(entry_1)
diary.add(entry_2)
diary.find_best_entry_for_reading_time(2, 2) # => nil

# 3
diary = Diary.new
entry_1 = DiaryEntry.new("Monday", "Walked the dog, it was great")
entry_2 = DiaryEntry.new("Tuesday", "Walked the cat, did not like it as the cat didn't like the rain")
diary.add(entry_1)
diary.add(entry_2)
diary.find_best_entry_for_reading_time(2, 4) # => [entry_1]

# 4
diary = Diary.new
entry_1 = DiaryEntry.new("Monday", "Walked the dog, it was great")
entry_2 = DiaryEntry.new("Tuesday", "Walked the cat, did not like it as the cat didn't like the rain")
entry_3 = DiaryEntry.new("Wednesday", "I met Adam today and he was a complete legend, his number is 07800123456")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.find_phone # => ["07800123456"]

# 5
diary = Diary.new
entry_1 = DiaryEntry.new("Monday", "Walked the dog, it was great")
entry_2 = DiaryEntry.new("Tuesday", "Walked the cat, did not like it as the cat didn't like the rain")
entry_3 = DiaryEntry.new("Wednesday", "I met Adam today and he was a complete legend, his number is 07800123456")
entry_4 = DiaryEntry.new("Thursday", "I met Alex today, he isn't as cool as Adam, his number is 07900654321")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.find_phone # => ["07800123456", 07900654321]

# Tasks Integration

# 1 
task_list = TaskList.new
task_1 = Task.new("Walk the dog")
task_2 = Task.new("Clean the cat")
task_list.add(task_1)
task_list.add(task_2)
task_list.list # => [task_1, task_2]
```

## 4. Create Examples as Unit Tests

```ruby
# Diary

#1
diary = Diary.new
diary.list # => []


# DiaryEntry

#1
entry = DiaryEntry.new("Monday", "Walk the dog")
entry.title # => "Monday"
entry.content # => "Walk the dog"

#2
diary = Diary.new
diary.count_words # => 0

# Task

#1
todo = Task.new("Clean the car")
todo.task # => [todo]

# TaskList

#1 
task_list = TaskList.new
task_list.list # => []
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->