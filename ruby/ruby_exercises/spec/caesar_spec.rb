require "./caesar_cipher"

describe "#caesar_cipher" do
  it "returns word shifted over by shift factor" do
    expect(caesar_cipher('hello', 3)).to eql("khoor")
  end

  it "works with uppercase or lowercase letters" do
    expect(caesar_cipher('Hello', 3)).to eql("Khoor")
  end

  it "works with multiple words" do
    expect(caesar_cipher('Hello bob', 3)).to eql("Khoor ere")
  end

  it "works with puncuntuation" do
    expect(caesar_cipher('Hello, bob', 3)).to eql("Khoor, ere")
  end

  it "works with any shift factor" do
    expect(caesar_cipher('Hello, bob', 100)).to eql("Dahhk, xkx")
  end

end
