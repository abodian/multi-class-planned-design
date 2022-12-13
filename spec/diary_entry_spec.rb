require_relative "../lib/diary_entry"

RSpec.describe "diary_entry tests" do
  it "add entry and return title & contents" do
    entry = DiaryEntry.new("Monday", "Walk the dog")
    expect(entry.title).to eq "Monday"
    expect(entry.contents).to eq "Walk the dog"
  end

  it "returns 0 when count_words is called" do
    entry = DiaryEntry.new("Monday", "")
    expect(entry.count_words).to eq 0
  end
end