module NullAttributesRemover
  def attributes(*args)
    hash = super
    hash.each do |key, value|
      if value.nil?
        hash.delete(key)
      end
    end
    hash
  end
end