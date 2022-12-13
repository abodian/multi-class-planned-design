require_relative "./diary_entry.rb"

class Diary
  def initialize
  @my_entries = []
  @entry_hash = {}
  end

  def add(entry)
    @my_entries << entry
  end

  def list
    @my_entries
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    words_can_read = wpm * minutes
    
    @my_entries.map do |entry|
      @entry_hash[entry.count_words] = entry.contents
    end
    sorted_hash = @entry_hash.sort_by { |count, chunk| count}.reverse!
    sorted_hash.find do |count,chunk|
      if count <= words_can_read
        return chunk
      end
    end
  end

  def find_phone
    contents_array = []
    @my_entries.each do |element| 
      contents_array << element.contents
    end
    contents_string = contents_array.join(" ")
    phone_numbers = contents_string.scan(/\d+.\d+.\d+/)
    print contents_string
    return phone_numbers
  end
end

# diary = Diary.new
# entry_1 = DiaryEntry.new("Monday", "Walked the dog, it was great")
# entry_2 = DiaryEntry.new("Tuesday", "Walked the cat, did not like it as the cat didn't like the rain")
# entry_3 = DiaryEntry.new("Wednesday", "I met Adam today and he was a complete legend, his number is 07800123456")
# entry_4 = DiaryEntry.new("Thursday", "I met Alex today, he isn't as cool as Adam, his number is 07800123456")
# diary.add(entry_1)
# diary.add(entry_2)
# diary.add(entry_3)
# diary.add(entry_4)

# diary.find_phone