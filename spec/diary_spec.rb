require_relative "../lib/diary"

RSpec.describe "Diary" do
  it "returns an empty array" do
    diary = Diary.new
    expect(diary.list).to eq []
  end

  it "returns an empty array when find_phone is called" do
    diary = Diary.new
    expect(diary.find_phone).to eq []
  end
end