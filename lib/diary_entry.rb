class DiaryEntry
  def initialize(title, contents)
  @title = title
  @contents = contents
  end

  def title
    return @title
  end
  
  def count_words
    @contents.split(" ").length
  end

  def contents
    return @contents
  end
end