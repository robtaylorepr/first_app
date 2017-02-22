
class Standard
  @lang = %q(
  Just plain text
  No hip nor samuel here...
  it just goes on and on and on..
  )

  def self.call(num=1)
    return [@lang * num]
  end

end
