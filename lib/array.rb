class Array

  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end
    result
  end


  def two_sum
    result = []
    self.each_index do |idx|
      next if idx > self.length - 2
      self.each_index do |idx2|
      next if idx >= idx2
      result << [idx, idx2] if self[idx] + self[idx2] == 0
    end
  end

    return result
  end


  def my_tranpose
    result = Array.new(self[0].count) {[]}
    self.each do |array|
      count = 0
      array.each do |el|
        result[count] << el
        count += 1
      end
    end
    result
  end

end
