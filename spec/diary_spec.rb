require_relative "../lib/diary"

RSpec.describe "Diary" do
  it "returns an empty array" do
    diary = Diary.new
    expect(diary.list).to eq []
  end
end