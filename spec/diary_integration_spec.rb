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
    expect(diary.find_best_entry_for_reading_time(2, 4)).to eq "Walked the dog, it was great"
  end

  it "returns nil when read_chunk is called" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("Monday", "Walked the dog, it was great")
    entry_2 = DiaryEntry.new("Tuesday", "Walked the cat, did not like it")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.find_best_entry_for_reading_time(2, 2)).to eq nil
  end

  it "returns a list of all phone numbers from all diary entries" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("Monday", "Walked the dog, it was great")
    entry_2 = DiaryEntry.new("Tuesday", "Walked the cat, did not like it as the cat didn't like the rain")
    entry_3 = DiaryEntry.new("Wednesday", "I met Adam today and he was a complete legend, his number is 07800123456")
    diary.add(entry_1)
    diary.add(entry_2)
    diary.add(entry_3)
    expect(diary.find_phone).to eq ["07800123456"]
  end

  it "returns multiple phone numbers from within entry" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("Monday", "Walked the dog, it was great")
    entry_2 = DiaryEntry.new("Tuesday", "Walked the cat, did not like it as the cat didn't like the rain")
    entry_3 = DiaryEntry.new("Wednesday", "I met Adam today and he was a complete legend, his number is 07800123456")
    entry_4 = DiaryEntry.new("Thursday", "I met Alex today, he isn't as cool as Adam, his number is 07800123321")
    diary.add(entry_1)
    diary.add(entry_2)
    diary.add(entry_3)
    diary.add(entry_4)
    expect(diary.find_phone).to eq ["07800123456", "07800123321"]
  end
end