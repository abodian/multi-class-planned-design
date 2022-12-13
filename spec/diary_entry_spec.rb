require_relative "../lib/diary_entry"

RSpec.describe "diary_entry tests" do
  it "add entry and return title & contents" do
    entry = DiaryEntry.new("Monday", "Walk the dog")
    expect(entry.title).to eq "Monday"
    expect(entry.contents).to eq "Walk the dog"
  end
end