require_relative "../lib/diary"
require_relative "../lib/diary_entry"

RSpec.describe "Diary integration" do
  it "add multiple entries and return as list" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("Monday", "Walked the dog, it was great")
    entry_2 = DiaryEntry.new("Tuesday", "Walked the cat, did not like it")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.list).to eq [entry_1, entry_2]
  end

  it "returns a chunk that can be read within parameters" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("Monday", "Walked the dog, it was great")
    entry_2 = DiaryEntry.new("Tuesday", "Walked the cat, did not like it as the cat didn't like the rain")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.read_chunk(2, 4)).to eq ["Walked the dog, it was great"]
  end
end