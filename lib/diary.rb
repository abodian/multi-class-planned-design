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
    phone_numbers = []
    contents_array = []
    @my_entries.each do |element| 
      contents_array << element.contents
    end
    contents_string = contents_array.join(" ")
    contents_string.split(" ").each do |entry|
      if entry.match(/\d{11}/)
        phone_numbers << entry
      end
    end
    return phone_numbers
  end
end

# diary = Diary.new
# entry_1 = DiaryEntry.new("Monday", "Walked the dog, it was great")
# diary.add(entry_1)
# print diary.find_phone