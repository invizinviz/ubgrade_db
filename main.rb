class Upgrade
  attr_accessor :list

  def initialize(list)
    self.list = list
  end

  def get_list
    @list
  end

  def get_list_of_script_files
    arr = []
    @list.each do |item|
      next if item == '.' or item == '..'
      arr << item
    end
    arr
  end

  def get_digit_array_from_files
    files = get_list_of_script_files
    arr = []
    files.map do |item|
      arr << item.scan(/\d/).join('').to_i
    end
    arr
  end



end