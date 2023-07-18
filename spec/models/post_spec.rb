require 'rails_helper'

RSpec.describe Post, type: :model do
  it "content length greater than 10" do
    post = Post.new(title: "Hello", content: "World", published: true)
    expect(post).to_not be_valid
  end
  it "content length greater than 10" do
    post = Post.new(title: "Hello", content: "Worlllllllllllllllld", published: true)
    expect(post).to be_valid
  end
  it "content can't be blank" do
    post = Post.new(title: "Hello", content: nil, published: true)
    expect(post).to_not be_valid
  end
  it "content can't be blank" do
    post = Post.new(title: "Hello", content: "Worlllllllllllllllld", published: true)
    expect(post).to be_valid
  end
end


