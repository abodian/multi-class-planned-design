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

  def read_chunk(wpm, minutes)
  # returns a string that can be read in the alotted time/speed
  end

  def find_phone
  # return a list of all phone numbers across all entries
  end
end

class DiaryEntry
  def initialize(title,contents)
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





```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
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