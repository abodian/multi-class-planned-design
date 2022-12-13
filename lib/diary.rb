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
  end

  def find_phone
  # return a list of all phone numbers across all entries
  end
end