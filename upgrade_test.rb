require 'minitest/autorun'
require_relative 'main'

class UpgradeTest < MiniTest::Unit::TestCase

  LIST = Dir.entries("scripts")

  def test_get_list
    detector = Upgrade.new(LIST)
    assert_equal [".", "..", "045.createtable.sql", "046.createtable.sql", "047.createtable.sql", "051.createtable.sql", "055createtable.sql"], detector.get_list
  end

  def test_get_arr
    detector = Upgrade.new(LIST)
    assert_equal ["045.createtable.sql", "046.createtable.sql", "047.createtable.sql", "051.createtable.sql", "055createtable.sql"], detector.get_list_of_script_files
  end

  def test_digit_arr
    detector = Upgrade.new(LIST)
    assert_equal [45, 46, 47, 51, 55], detector.get_digit_array_from_files
  end

  def test_do_not_upgrade_db_if_current_version
    detector = Upgrade.new(LIST)
    assert_equal ["This is current version"], detector.upgrade_db(55)
  end

  def test_upgrade_db
    detector = Upgrade.new(LIST)
    assert_equal [46, 47, 51, 55], detector.upgrade_db(46)
  end

  def test_change_db_version
    detector = Upgrade.new(LIST)
    assert_equal 47, detector.change_db_version(47)
  end

  # def test_run_file
  #   detector = Upgrade.new(LIST)
  #   assert_equal "051.createtable.sql", detector.run_file(51)
  # end

end