class Diary
  def initialize
  @my_entries = []
  end

  def add(entry)
    @my_entries << entry
  end

  def list
    @my_entries
  end

  def read_chunk(wpm, minutes)
  # returns a string that can be read in the alotted time/speed
  end

  def find_phone
  # return a list of all phone numbers across all entries
  end
end