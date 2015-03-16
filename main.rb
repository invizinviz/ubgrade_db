class Upgrade
  attr_accessor :list, :version

  def initialize(list, version)
    self.list = list
    @version = version
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

  def upgrade_db(version)
    digit_arr = get_digit_array_from_files
    count = 0
    arr = []
    if version == digit_arr.last
      arr << "This is current version"
    else
      digit_arr.each do |item|
        if version <= item 
          (count..digit_arr.count).each do
            arr << digit_arr[count] if digit_arr[count] != nil
            run_file(arr.last)
            count += 1
          end
        else
          count += 1
        end
      end
    end
    change_db_version(arr.last)
    arr
  end

  def change_db_version(new_version)
    @version = new_version
  end

  def run_file(file_number)
    files = get_list_of_script_files
    files.each do |file|
      if file.scan(/\d/).join('').to_i == file_number
        system("scripts/#{file}")
      end
    end
  end

end