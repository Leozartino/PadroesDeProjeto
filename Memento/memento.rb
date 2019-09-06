#
class Post
  attr_accessor :title, :body

  def initialize(title, body)
    @title, @body = title, body
  end

  def save
    PostVersion.new self
  end

  def rollback(version)
    @title = version.title
    @body  = version.body
  end
end

class PostVersion
  attr_reader :title, :body

  def initialize(post)
    @title = post.title
    @body  = post.body
  end
end

class VersionHistory # folder
  attr_reader :versions

  def initialize
    @versions       = {}
    @version_number = 0
  end

  def add(version)
    @versions[@version_number] = version
    @version_number            += 1
  end

  def version(number)
    @versions[number]
  end
end

# Create a Post and a Folder
post   = Post.new('My First Post', 'This is my first post. I hope people like it')
folder = VersionHistory.new

# Save the Post to the folder
folder.add(post.save)

# Check Status'
puts post.title
# => My First Post
puts post.body
# => This is my first post. I hope people like it

# Update the Post and save it
post.title = 'My First Post now with a longer title!'
post.body  = "I hated my first introduction. I needed to rewrite it - here's the updated version"
folder.add(post.save)

puts post.title
# => My First Post now with a longer title!
puts post.body
# => I hated my first introduction. I needed to rewrite it - here's the updated version

# Everyone hates my updated version, let's restore the old one
post.rollback(folder.version(0))

puts post.title
# => My First Post
puts post.body
# => This is my first post. I hope people like it