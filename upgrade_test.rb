require 'minitest/autorun'
require_relative 'main'

class UpgradeTest < MiniTest::Unit::TestCase

  LIST = Dir.entries("scripts")
  VERSION = 44

  def test_get_list
    skip
    detector = Upgrade.new(LIST, VERSION)
    assert_equal [".", "..", "045.createtable.sql", "046.createtable.sql", "047.createtable.sql", "051.createtable.sql", "055createtable.sql"], detector.get_list
  end

  def test_get_arr
    skip
    detector = Upgrade.new(LIST, VERSION)
    assert_equal ["045.createtable.sql", "046.createtable.sql", "047.createtable.sql", "051.createtable.sql", "055createtable.sql"], detector.get_list_of_script_files
  end

  def test_digit_arr
    skip
    detector = Upgrade.new(LIST, VERSION)
    assert_equal [45, 46, 47, 51, 55], detector.get_digit_array_from_files
  end

  def test_do_not_upgrade_db_if_current_version
    skip
    detector = Upgrade.new(LIST, VERSION)
    assert_equal ["This is current version"], detector.upgrade_db(55)
  end

  def test_upgrade_db
    detector = Upgrade.new(LIST, VERSION)
    assert_equal [45, 46, 47, 51, 55], detector.upgrade_db("scripts",VERSION)
  end

  def test_change_db_version
    skip
    detector = Upgrade.new(LIST, VERSION)
    assert_equal VERSION, detector.change_db_version(VERSION)
  end

  def test_run_file
    skip
    detector = Upgrade.new(LIST, VERSION)
    assert_equal true, detector.run_file("scripts", 47)
  end

end